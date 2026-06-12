# 루프 엔지니어링 (Loop Engineering) 학습 노트

> AI 에이전트에게 프롬프트를 직접 입력하는 시대를 지나,
> **"에이전트에게 프롬프트를 주는 루프(시스템)를 설계하는"** 새로운 실천법.

- 작성일: 2026-06-13 (개념이 폭발한 지 약 1주일 시점의 정리)
- 대상: 프롬프트 엔지니어링/컨텍스트 엔지니어링 개념을 어느 정도 아는 개발자

## 도식화 페이지

전체 내용을 한 장의 인터랙티브 다이어그램으로 정리한 HTML 버전: **[index.html](index.html)**
(브라우저에서 열기: `open docs/loop-engineering/index.html` 또는 `python3 -m http.server`로 서빙)

## 목차

| 장 | 문서 | 내용 |
|----|------|------|
| 1 | [01-개념과-배경.md](01-개념과-배경.md) | 정의, 탄생 배경(2026년 6월), 프롬프트→컨텍스트→루프 엔지니어링의 흐름 |
| 2 | [02-에이전트-루프의-구조.md](02-에이전트-루프의-구조.md) | 루프의 해부학: Perceive→Reason→Plan→Act→Observe, 수집→실행→검증 |
| 3 | [03-계보와-설계-패턴.md](03-계보와-설계-패턴.md) | ReAct(2022) → AutoGPT(2023) → Ralph(2025) → /goal → 루프 엔지니어링 |
| 4 | [04-실전-구성요소와-가드레일.md](04-실전-구성요소와-가드레일.md) | 5대 구성요소, 종료 조건, 비용 통제, 실패 모드 |
| 5 | [05-리스크와-실천-가이드.md](05-리스크와-실천-가이드.md) | 이해 부채, 인지적 항복, 패턴 선택 가이드, 다음 학습 주제 |
| 부록 | [06-하네스와-루프.md](06-하네스와-루프.md) | 하네스 엔지니어링 vs 루프 엔지니어링 — 레이어 구분, 7-plane 프레임워크 |

## 한 문장 요약

> **루프 = 트리거 + 검증 가능한 목표.** 에이전트는 목표가 충족될 때까지 스스로 돈다.
> 루프 엔지니어링은 그 루프가 **신뢰할 수 있게 돌도록** 목표 명세, 검증 게이트, 가드레일을 설계하는 일이다.

## 핵심 인용

- "코딩 에이전트에게 더 이상 프롬프트를 치지 마라. 에이전트에게 프롬프트를 주는 루프를 설계하라." — Peter Steinberger (2026-06-08, X에서 650만 뷰)
- "나는 더 이상 Claude에게 프롬프트하지 않는다. 루프들이 돌면서 Claude에게 프롬프트한다. 내 일은 루프를 작성하는 것이다." — Boris Cherny (Claude Code 창시자, Anthropic)
- "좋은 에이전트는 '똑똑한 프롬프트'가 아니라 '규율 있는 루프'다."

## 주요 출처

- [Loop Engineering — Addy Osmani (Substack)](https://addyo.substack.com/p/loop-engineering) ← 용어를 정리한 1차 문헌
- [Agentic Loops: From ReAct to Loop Engineering (2026 Guide) — Data Science Dojo](https://datasciencedojo.com/blog/agentic-loops-explained-from-react-to-loop-engineering-2026-guide/)
- [How Claude Code works — Claude Code Docs](https://code.claude.com/docs/en/how-claude-code-works)
- [What Is Loop Engineering? — MindStudio](https://www.mindstudio.ai/blog/what-is-loop-engineering-ai-coding-agents)
- [Loop Engineering: Coding Agent Loops 2026 Guide — explainx.ai](https://explainx.ai/blog/loop-engineering-coding-agents-claude-code-guide-2026)
- [What Is the AI Agent Loop? — Oracle Developers Blog](https://blogs.oracle.com/developers/what-is-the-ai-agent-loop-the-core-architecture-behind-autonomous-ai-systems)
