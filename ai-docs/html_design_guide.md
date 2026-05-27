# Modern Startup Style HTML Design Guide

이 가이드는 AI에게 **"모던 스타트업/SaaS 스타일의 고품질 HTML 랜딩 페이지"**를 생성해달라고 요청할 때 사용할 수 있는 프롬프트 가이드입니다. 이 문서의 내용을 복사하여 AI에게 전달하면, 현재와 같은 높은 퀄리티의 결과물을 일관되게 얻을 수 있습니다.

## 🚨 가장 중요한 생성 원칙: Base Template 복사 🚨

새로운 HTML 문서를 생성할 때는 처음부터 코드를 작성(Generate)하지 마세요. 
반드시 **`ai-docs/base_template.html` 파일의 코드를 통째로 복사한 뒤, `<main>` 태그 내부 영역만 수정**하여 생성해야 합니다. 
이는 사이트 전체의 완벽한 레이아웃(헤더, 푸터, 테마 스크립트 등) 일관성을 유지하기 위한 최우선 규칙입니다.

## 프롬프트 템플릿 (AI에게 복사해서 전달할 내용)

> "새로운 랜딩 페이지(또는 웹 페이지)를 만들려고 해. **먼저 `ai-docs/base_template.html` 파일의 내용을 전부 복사해.** 그리고 복사한 코드에서 `<main>` 태그 안의 내용만 비우고, 내가 요청하는 내용을 **Modern Startup / SaaS 스타일**로 채워넣어줘. Header, Footer, Head 태그 등은 절대 건드리지 마."

### 1. 기술 스택 (Tech Stack)
*   **CSS Framework:** Tailwind CSS (CDN 방식 사용, `<script src="https://cdn.tailwindcss.com"></script>`)
*   **Fonts:** 본문용 메인 폰트 `Pretendard` (CDN), 고정폭(Code, Pre 등) 폰트 `Cascadia Mono` (Google Fonts)
*   **Icons:** 이모지를 절대 사용하지 말고, Font Awesome 6.5.1 CDN을 포함하여 `<i class="fa-solid fa-user"></i>` 처럼 심플한 폰트 아이콘을 사용할 것.
*   **Script:** Vanilla Javascript (스크롤 애니메이션 및 테마 토글, 클릭 이벤트 등)

### 2. 디자인 핵심 원칙 (Design Principles)
*   **테마 전환 지원 (Light / Dark):** `tailwind.config`에서 `darkMode: 'class'`를 설정하고, 우측 상단에 해/달 아이콘이 바뀌는 테마 토글 버튼을 반드시 포함. `localStorage`를 이용해 테마 상태를 저장할 것.
*   **Glassmorphism (유리 질감):** 상단 고정 헤더(Sticky Header)는 반투명 배경과 `backdrop-blur` (최소 12px) 효과를 사용하여 스크롤 시 뒷배경이 은은하게 비치도록 구성할 것.
*   **Glow & Gradients 이펙트:** 
    *   Hero 섹션의 강조 텍스트는 그라데이션 텍스트(`bg-clip-text text-transparent`)에 반짝이는 애니메이션(`background-position` 이동)을 적용.
    *   배경에 방사형 그라데이션(Radial Gradient)을 활용한 은은한 Glow 박스를 배치하여 공간감과 입체감을 부여.
*   **카드 호버 (Card Hover) 효과:** 카드 요소에 마우스를 올렸을 때 살짝 위로 떠오르는 효과(`translate-y-[-5px]`), 부드러운 그림자 확장(`box-shadow`), 테두리 색상 변화 트랜지션을 적용할 것.

### 3. 동적 요소 및 애니메이션 (Animations)
*   **Scroll Reveal (스크롤 페이드인):** 페이지를 스크롤할 때 요소가 화면에 나타나면 아래에서 위로 부드럽게 나타나는(`Fade-in-up`) 효과를 Vanilla JS(`getBoundingClientRect` 또는 `IntersectionObserver`)로 구현.
*   **Floating Elements (부유 효과):** 중요한 그래픽 요소(터미널 창 등)는 위아래로 천천히 움직이는 커스텀 `float` 애니메이션을 적용.
*   **마이크로 인터랙션:** 모든 버튼과 링크에 `transition-all duration-300`을 적용하여 시각적 피드백을 부드럽게 제공할 것.

### 4. 권장 레이아웃 구조 (Layout)
1.  **Header:** 투명한 고정 헤더. 좌측 로고, 중앙 네비게이션, 우측 테마 토글 및 CTA 버튼.
2.  **Hero Section:** 커다란 타이틀, 서브 텍스트, 메인 CTA 버튼. 우측에는 시각적 흥미를 끄는 요소(애니메이션이 들어간 코드 블록 등).
3.  **Why & Features:** 아이콘, 타이틀, 설명으로 이루어진 그리드(Grid) 형태의 카드 레이아웃.
4.  **Code/Install Block:** 터미널 창을 모방한 다크 모드 스타일의 코드 박스. 우측 상단에 'Copy to clipboard' 버튼 포함.
5.  **FAQ:** 사용자들의 궁금증을 해소하는 섹션.
6.  **Footer:** 간결한 카피라이트와 추가 정보.

### 5. 핵심 코드 스니펫 (Reference Code)
AI가 완벽하게 일관된 스타일을 재현할 수 있도록, 아래의 핵심 CSS와 Tailwind Config 코드를 프롬프트에 함께 제공해주세요.

```html
<!-- 폰트 및 아이콘 설정 (Pretendard, Cascadia Mono, Font Awesome) -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Cascadia+Mono:ital,wght@0,200..700;1,200..700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Tailwind Config 애니메이션 및 폰트 설정 예시 -->
<script>
    tailwind.config = {
        darkMode: 'class',
        theme: {
            extend: {
                fontFamily: {
                    sans: ['Pretendard', 'sans-serif'],
                    mono: ['"Cascadia Mono"', 'Pretendard', 'monospace'],
                },
                colors: { gray: { 900: '#0f1115', 800: '#161b22', 700: '#21262d' } },
                animation: {
                    'float': 'float 6s ease-in-out infinite',
                    'fade-in-up': 'fadeInUp 0.8s ease-out forwards',
                },
                keyframes: {
                    float: { '0%, 100%': { transform: 'translateY(0)' }, '50%': { transform: 'translateY(-20px)' } },
                    fadeInUp: { '0%': { opacity: '0', transform: 'translateY(30px)' }, '100%': { opacity: '1', transform: 'translateY(0)' } }
                }
            }
        }
    }
</script>

<!-- CSS: Glow 배경 및 핵심 클래스 -->
<style>
    .glass-header {
        background: rgba(255, 255, 255, 0.7); backdrop-filter: blur(12px); border-bottom: 1px solid rgba(0, 0, 0, 0.05);
    }
    .dark .glass-header {
        background: rgba(15, 17, 21, 0.7); border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    }
    .gradient-text {
        background: linear-gradient(to right, #0ea5e9, #6366f1, #a855f7);
        -webkit-background-clip: text; -webkit-text-fill-color: transparent;
    }
    .dark .gradient-text {
        background: linear-gradient(to right, #38bdf8, #818cf8, #c084fc);
    }
    .glow-bg {
        position: absolute; width: 100%; max-width: 800px; height: 800px; z-index: -1; pointer-events: none;
        background: radial-gradient(circle, rgba(14, 165, 233, 0.08) 0%, rgba(255, 255, 255, 0) 70%);
        top: -300px; left: 50%; transform: translateX(-50%); transition: all 0.5s ease;
    }
    .dark .glow-bg {
        background: radial-gradient(circle, rgba(56, 189, 248, 0.1) 0%, rgba(15, 17, 21, 0) 70%);
    }
    .reveal { opacity: 0; transform: translateY(30px); transition: all 0.8s ease-out; }
    .reveal.active { opacity: 1; transform: translateY(0); }
</style>
```

---
**사용 팁:** 특정 프로젝트에 맞게 위 템플릿의 '권장 레이아웃 구조' 항목에 원하시는 세부 섹션 이름이나 내용을 추가해서 질문하시면 훨씬 더 정확한 페이지를 생성해냅니다.
