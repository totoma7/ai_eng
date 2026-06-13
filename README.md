# ai_eng — AI 엔지니어링 학습 노트

AI 에이전트 시대의 엔지니어링 기법을 주제별로 리서치하고 한국어로 정리하는 저장소입니다.

> 🌐 **바로가기**: [인터랙티브 도식화 페이지](https://totoma7.github.io/ai_eng/docs/loop-engineering/) ·
> [사이트 루트](https://totoma7.github.io/ai_eng/) ·
> [실습 가이드](practice/ralph-loop/README.md)

> 프롬프트 엔지니어링(2022) → 컨텍스트 엔지니어링(2024) → **루프 엔지니어링(2026)**
> 개입 지점이 "한 번의 요청"에서 "정보 공급"으로, 다시 "공급 시스템 그 자체"로 올라가는 흐름을 따라갑니다.

## 📚 학습 주제

### 1. 루프 엔지니어링 (Loop Engineering)

> **루프 = 트리거 + 검증 가능한 목표.**
> 에이전트에게 프롬프트를 직접 치는 대신, 에이전트에게 프롬프트를 주는 루프(시스템)를 설계하는 규율.

| 문서 | 내용 |
|------|------|
| [📖 목차 (README)](docs/loop-engineering/README.md) | 전체 개요, 핵심 인용, 출처 |
| [1장. 개념과 배경](docs/loop-engineering/01-개념과-배경.md) | 정의, 2026년 6월의 탄생 배경, 패러다임 이동 |
| [2장. 에이전트 루프의 구조](docs/loop-engineering/02-에이전트-루프의-구조.md) | 수집→실행→검증 / Perceive~Observe 모형, 검증자 분리 |
| [3장. 계보와 설계 패턴](docs/loop-engineering/03-계보와-설계-패턴.md) | ReAct → AutoGPT → Ralph Loop → /goal → 루프 엔지니어링 |
| [4장. 실전 구성요소와 가드레일](docs/loop-engineering/04-실전-구성요소와-가드레일.md) | 5대 구성요소 + 외부 메모리, 종료 전략, 실패 모드 |
| [5장. 리스크와 실천 가이드](docs/loop-engineering/05-리스크와-실천-가이드.md) | 이해 부채, 인지적 항복, 6단계 실습 로드맵 |
| [부록. 하네스와 루프](docs/loop-engineering/06-하네스와-루프.md) | 하네스 엔지니어링 vs 루프 엔지니어링, 7-plane 프레임워크 |
| [부록. 자바 프레임워크 비교](docs/loop-engineering/07-자바-프레임워크-비교.md) | 진화 단계별 차이를 LangChain4j vs Spring AI 코드로 비교 |

**🎨 [인터랙티브 도식화 페이지](https://totoma7.github.io/ai_eng/docs/loop-engineering/)**
— 전체 내용을 한 장의 다이어그램으로 정리한 HTML 버전 (GitHub Pages).
페이지 하단 "08 전체 문서" 섹션에서 모든 챕터·실습으로 이동할 수 있습니다.
로컬 실행: `open docs/loop-engineering/index.html`

## 🛠 실습 (Practice)

| 실습 | 내용 |
|------|------|
| [ralph-loop](practice/ralph-loop/README.md) | 검증 가능한 목표 명세 → ralph식 루프 직접 구현. 버그 2개짜리 샘플을 에이전트 루프가 자동 수렴시키고, 무진행 감지·반복 상한 가드레일을 재현한다. |

```bash
cd practice/ralph-loop && ./ralph.sh   # 2회 반복 후 게이트 통과
```

## 🔑 핵심 인용

> "코딩 에이전트에게 프롬프트하지 마라. 에이전트에게 프롬프트를 주는 **루프를 설계**하라."
> — Peter Steinberger (2026-06-08)

> "나는 더 이상 Claude에게 프롬프트하지 않는다. 루프들이 돌면서 Claude에게 프롬프트한다. **내 일은 루프를 쓰는 것**이다."
> — Boris Cherny (Claude Code 창시자, Anthropic)

> "루프를 만들어라. 단, **엔지니어로 남을 사람**처럼 만들어라. '실행 버튼만 누르는 사람'이 아니라."
> — Addy Osmani

## 📎 주요 출처

- [Loop Engineering — Addy Osmani](https://addyo.substack.com/p/loop-engineering) (1차 문헌)
- [Agentic Loops: From ReAct to Loop Engineering — Data Science Dojo](https://datasciencedojo.com/blog/agentic-loops-explained-from-react-to-loop-engineering-2026-guide/)
- [How Claude Code works — Claude Code Docs](https://code.claude.com/docs/en/how-claude-code-works)
- [What Is Loop Engineering? — MindStudio](https://www.mindstudio.ai/blog/what-is-loop-engineering-ai-coding-agents)

## 🗺️ 앞으로 다룰 주제 (후보)

- 하네스 엔지니어링 (Harness Engineering) 심화 — 7-plane 프레임워크
- 멀티 에이전트 감독 (Multi-Agent Supervision)
- 평가(Evals) 설계 — 검증 게이트의 품질이 곧 루프의 품질
- Ralph Loop 직접 구현 실습
