# AGENTS.md

This file contains project-specific guidelines for AI coding assistants.

## 1. UI/UX & HTML Design
- **HTML 문서 생성의 절대 규칙**: 새로운 HTML 페이지를 만들 때는 스크래치부터 작성하지 마십시오. 반드시 **`ai-docs/base_template.html`** 파일의 전체 코드를 복사(Base 템플릿으로 사용)한 뒤, 오직 `<main>` 태그 내부의 내용만 수정하십시오. (Header, Footer, Head 설정 변경 금지)
- **HTML 랜딩 페이지/UI 생성 시**: 반드시 `ai-docs/html_design_guide.md` 파일에 정의된 "Modern Startup / SaaS 스타일" 가이드라인(Tailwind CSS, Glassmorphism, Animations 등)을 참고하여 `<main>` 내부를 디자인할 것.
- 인라인 스타일은 피하고, 제공된 가이드에 명시된 설정 및 구조(Tailwind config, CDN)를 따를 것.
- **Favicon 설정**: `base_template.html`에 이미 `assets/icons/favicon.svg`가 적용되어 있습니다. 임의로 변경하지 마십시오.

## 2. HTML Files Management
- **ai-html 폴더 내 HTML 생성 시**: 새로운 HTML 파일을 `ai-html` 폴더에 생성하거나 추가할 경우, 반드시 `ai-html/pages.json` 파일을 확인하고 새로운 페이지 정보를 함께 업데이트(등록)할 것.
