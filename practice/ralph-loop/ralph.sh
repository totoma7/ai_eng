#!/usr/bin/env bash
# ralph.sh — ralph식 에이전트 루프 (학습용 최소 구현)
#
# 루프 엔지니어링 공식: 루프 = 트리거 + 검증 가능한 목표
#   트리거      : 이 while 루프 (매 반복 에이전트를 새 프로세스로 호출 = 새 컨텍스트)
#   게이트      : node --test 종료 코드 0 (goal.md 참조)
#   가드레일    : 반복 상한(MAX_ITER), 무진행 감지(STALL_LIMIT)
#   외부 메모리 : progress.md (모델은 실행 사이에 잊는다 — 파일이 기억한다)
#
# 사용법:
#   ./ralph.sh                          # mock 에이전트로 실행
#   AGENT_CMD="claude -p ..." ./ralph.sh  # 실제 에이전트로 실행
set -uo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
MAX_ITER="${MAX_ITER:-5}"
STALL_LIMIT="${STALL_LIMIT:-2}"
AGENT_CMD="${AGENT_CMD:-$DIR/mock-agent.sh}"
PROGRESS="$DIR/progress.md"

# 게이트: 실패 테스트 수를 출력 (0 = 통과). 판정은 기계가 한다.
fail_count() {
  local out
  if out="$(node --test --test-reporter=tap "$DIR/sample/calc.test.js" 2>&1)"; then
    echo 0
  else
    echo "$out" | awk '$1=="#" && $2=="fail" {print $3; found=1} END {if (!found) print 99}'
  fi
}

echo "" >> "$PROGRESS"
echo "## ralph run — $(date '+%Y-%m-%d %H:%M:%S') (MAX_ITER=$MAX_ITER, STALL_LIMIT=$STALL_LIMIT)" >> "$PROGRESS"

prev_fails="-1"
stall=0

for ((i = 1; i <= MAX_ITER; i++)); do
  fails="$(fail_count)"

  # ① 게이트 통과 → 성공 종료 (루프의 유일한 정상 출구)
  if [[ "$fails" == "0" ]]; then
    echo "- ✅ 게이트 통과 — 반복 $((i - 1))회 만에 목표 달성" >> "$PROGRESS"
    echo "GATE PASSED after $((i - 1)) iteration(s)."
    exit 0
  fi

  # ② 무진행 감지 → 중단 (진행을 환각하며 토큰만 태우는 상태 차단)
  if [[ "$fails" == "$prev_fails" ]]; then
    stall=$((stall + 1))
    if ((stall >= STALL_LIMIT)); then
      echo "- ⛔ 무진행 감지 — 실패 ${fails}개가 ${STALL_LIMIT}회 연속 동일. 중단" >> "$PROGRESS"
      echo "NO-PROGRESS detected (fails=$fails unchanged x$STALL_LIMIT). Aborting."
      exit 2
    fi
  else
    stall=0
  fi
  prev_fails="$fails"

  # ③ 에이전트 호출 — 매번 새 프로세스 = 새 컨텍스트 (ralph 핵심)
  #    에이전트는 대화 기록 없이 파일시스템만 보고 판단한다.
  action="$($AGENT_CMD 2>&1)" || action="agent error: $action"

  # ④ 외부 메모리에 기록
  echo "- iter $i | 실패 ${fails}개 | 조치: ${action}" >> "$PROGRESS"
  echo "[iter $i] fails=$fails | $action"
done

# ⑤ 상한 도달 — 마지막 게이트 재확인 후 종료
if [[ "$(fail_count)" == "0" ]]; then
  echo "- ✅ 게이트 통과 — 반복 ${MAX_ITER}회 만에 목표 달성" >> "$PROGRESS"
  echo "GATE PASSED after ${MAX_ITER} iteration(s)."
  exit 0
fi
echo "- ⛔ 반복 상한(${MAX_ITER}) 도달 — 게이트 미통과" >> "$PROGRESS"
echo "MAX_ITER ($MAX_ITER) reached without passing gate."
exit 1
