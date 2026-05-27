# AGENTS.md

This file contains project-specific guidelines for AI coding assistants.

## 1. UI/UX & HTML Design
- **HTML 랜딩 페이지/UI 생성 시**: 반드시 `ai-docs/html_design_guide.md` 파일에 정의된 "Modern Startup / SaaS 스타일" 가이드라인(Tailwind CSS, Glassmorphism, Animations 등)을 최우선으로 참고하여 작성할 것.
- 인라인 스타일은 피하고, 제공된 가이드에 명시된 설정 및 구조(Tailwind config, CDN)를 따를 것.

## 2. HTML Files Management
- **ai-html 폴더 내 HTML 생성 시**: 새로운 HTML 파일을 `ai-html` 폴더에 생성하거나 추가할 경우, 반드시 `ai-html/pages.json` 파일을 확인하고 새로운 페이지 정보를 함께 업데이트(등록)할 것.
