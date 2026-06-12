#!/usr/bin/env bash
# mock-agent.sh — 모의 에이전트 (claude CLI 없이 루프 메커니즘을 시연)
#
# ralph 원칙 재현:
#   - 무상태: 대화 기록이 없다. 매 호출이 새 컨텍스트.
#   - 파일시스템이 유일한 상태: 소스 코드를 읽고 무엇이 깨졌는지 스스로 판단.
#   - 한 호출 = 한 가지 수정: 커밋 크기 단위의 변경 (2장: 리뷰 가능한 단위)
#
# 실제 에이전트로 바꾸려면 ralph.sh에서:
#   AGENT_CMD='claude -p "goal.md를 읽고 sample/의 실패 테스트를 1개만 고쳐라"' ./ralph.sh
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
CALC="$DIR/sample/calc.js"

if grep -q 'return a - b' "$CALC"; then
  node -e '
    const fs = require("fs");
    const p = process.argv[1];
    fs.writeFileSync(p, fs.readFileSync(p, "utf8").replace("return a - b;", "return a + b;"));
  ' "$CALC"
  echo "fix: add()의 오연산 수정 (a - b → a + b)"
elif ! grep -q 'b === 0' "$CALC"; then
  node -e '
    const fs = require("fs");
    const p = process.argv[1];
    const guard = "  if (b === 0) throw new Error(\"division by zero\");\n  return a / b;";
    fs.writeFileSync(p, fs.readFileSync(p, "utf8").replace("  return a / b;", guard));
  ' "$CALC"
  echo "fix: divide()에 0 나누기 가드 추가"
else
  echo "no-op: 수정할 알려진 버그 없음"
fi
