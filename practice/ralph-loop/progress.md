# progress.md — 외부 메모리 (External Memory)

> 루프의 "척추". 에이전트는 실행 사이에 모든 것을 잊는다 — 이 파일이 기억한다.
> 아래는 실제 실행 기록. `./ralph.sh`를 돌리면 이어서 기록된다.

## ralph run — 2026-06-13 08:54:17 (MAX_ITER=5, STALL_LIMIT=2) — 정상 수렴
- iter 1 | 실패 2개 | 조치: fix: add()의 오연산 수정 (a - b → a + b)
- iter 2 | 실패 1개 | 조치: fix: divide()에 0 나누기 가드 추가
- ✅ 게이트 통과 — 반복 2회 만에 목표 달성

## ralph run — 2026-06-13 08:54:31 (MAX_ITER=5, STALL_LIMIT=2) — 무진행 가드 시연 (no-op 에이전트)
- iter 1 | 실패 2개 | 조치:
- iter 2 | 실패 2개 | 조치:
- ⛔ 무진행 감지 — 실패 2개가 2회 연속 동일. 중단

## ralph run — 2026-06-13 08:54:45 (MAX_ITER=2, STALL_LIMIT=99) — 반복 상한 가드 시연
- iter 1 | 실패 2개 | 조치:
- iter 2 | 실패 2개 | 조치:
- ⛔ 반복 상한(2) 도달 — 게이트 미통과
