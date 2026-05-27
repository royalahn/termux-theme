# AGENTS.md

This file contains project-specific guidelines for AI coding assistants.

## 1. UI/UX & HTML Design
- **HTML 문서 생성의 절대 규칙**: 새로운 HTML 페이지를 만들 때는 스크래치부터 작성하지 마십시오. 반드시 **`ai-docs/base_template.html`** 파일의 전체 코드를 복사(Base 템플릿으로 사용)한 뒤, 기본적으로 `<main>` 태그 내부 영역을 중심적으로 수정하십시오. 단, Header 영역의 로고 아이콘(`<svg>`)과 Title 텍스트(`<h1>`)는 생성하는 페이지 성격에 맞게 변경해야 합니다. 그 외의 Footer, Head 설정 등 기본 구조는 변경을 금지합니다.
- **HTML 랜딩 페이지/UI 생성 시**: 반드시 `ai-docs/html_design_guide.md` 파일에 정의된 "Modern Startup / SaaS 스타일" 가이드라인(Tailwind CSS, Glassmorphism, Animations 등)을 참고하여 `<main>` 내부를 디자인할 것.
- 인라인 스타일은 피하고, 제공된 가이드에 명시된 설정 및 구조(Tailwind config, CDN)를 따를 것.
- **Favicon 설정**: `base_template.html`에 이미 `assets/icons/favicon.svg`가 적용되어 있습니다. 임의로 변경하지 마십시오.

## 2. HTML Files Management
- **ai-html 폴더 내 HTML 생성 시**: 새로운 HTML 파일을 `ai-html` 폴더에 생성하거나 추가할 경우, 반드시 `ai-html/pages.json` 파일을 확인하고 새로운 페이지 정보를 함께 업데이트(등록)할 것.
