[한국어](README.md) | [영어](README_en.md)

# Termux Theme & Utilities Installer

이 프로젝트는 Android의 **Termux** 환경을 아름답고 효율적인 개발 환경으로 꾸며주는 자동화 스크립트입니다. Zsh, Oh My Zsh, Powerline 폰트, 그리고 유용한 플러그인과 도구들을 한
번에 설치하고 설정해줍니다.

## ✨ 주요 기능 (Features)

이 스크립트를 실행하면 다음 항목들이 자동으로 설치 및 설정됩니다.

### 1. 쉘 및 테마 (Shell & Theme)

- **Zsh**: 기본 쉘을 Zsh로 변경합니다.
- **Oh My Zsh**: Zsh 설정을 관리하기 위한 프레임워크를 설치합니다.
- **Agnoster 테마**: 가독성이 좋고 Git 상태를 잘 보여주는 Powerline 기반 테마를 적용합니다.
- **Powerline 폰트**: 테마가 깨지지 않고 예쁘게 보이도록 특수 폰트를 적용합니다.
- **Color Scheme**: 눈이 편안한 **Snazzy** 컬러 스킴을 Termux에 적용합니다.

### 2. 강력한 플러그인 (Plugins)

생산성을 높여주는 핵심 Zsh 플러그인들이 포함되어 있습니다.

- **zsh-autosuggestions**: 이전에 입력한 명령어를 바탕으로 실시간 자동 완성을 제안합니다.
- **zsh-syntax-highlighting**: 명령어 입력 시 올바른 명령어인지 색상으로 구분해줍니다.
- **zsh-completions**: 다양한 명령어에 대한 추가적인 탭 완성 기능을 제공합니다.
- **fzf**: 터미널에서 파일을 빠르고 직관적으로 찾을 수 있는 Fuzzy Finder를 설치합니다.

### 3. 필수 유틸리티 (Utilities)

개발 및 시스템 관리에 필요한 도구들을 함께 설치합니다.

- `git`, `vim`
- `openssh`, `sshpass` (SSH 접속 자동화 도구)
- `htop` (시스템 모니터링)
- `wget`, `netcat-openbsd`
- `kubectl` (Kubernetes 제어 도구)
- `screenfetch`, `neofetch` (시스템 정보 표시)

### 4. 개발 환경 설정 (Configuration)

- **Vim 설정 (`.vimrc`)**: 구문 강조(Syntax Highlighting), 줄 번호 표시, 자동 들여쓰기 등 코딩에 최적화된 설정이 적용됩니다.
- **Git 설정**: 미리 정의된 `.gitconfig`를 복사하여 기본적인 Git 환경을 구성합니다.
- **SSH Alias**: 로컬 호스트 접속을 위한 `ssh1` alias가 설정됩니다 (`sshpass` 사용).

---

## 🚀 설치 방법 (Installation)

Termux를 실행한 후, 다음 명령어들을 순서대로 입력하세요.

### 방법 1: 전체 설치 (권장)

모든 패키지, 설정, 테마를 한 번에 설치합니다.

```bash
# 저장소 클론
git clone https://github.com/royalahn/termux-theme.git

# 디렉토리 이동
cd termux-theme

# 실행 권한 부여
chmod +x install.sh

# 설치 스크립트 실행
./install.sh
```

설치가 완료되면 **Termux를 완전히 껐다가 다시 실행**하세요.

### 방법 2: Zsh 및 테마만 설정 (`zsh-install.sh`)

이미 필요한 패키지가 설치되어 있거나, Zsh 환경 설정만 원하는 경우 사용합니다.

```bash
cd termux-theme
chmod +x zsh-install.sh
./zsh-install.sh
```

---

## 📂 파일 구조 설명

- `install.sh`: 전체 설치 스크립트. 패키지 업데이트, 프로그램 설치, 테마 및 폰트 적용을 수행합니다.
- `zsh-install.sh`: Zsh 설정 전용 스크립트. Oh My Zsh 및 플러그인만 빠르게 설정합니다.
- `.termux/`: Termux 앱의 설정 파일(폰트, 색상)이 포함된 디렉토리입니다.
    - `colors.properties`: Snazzy 컬러 테마 정의.
    - `font.ttf`, `alternative.ttf`: Powerline 지원 폰트.
- `.vimrc`: Vim 에디터 설정 파일.
- `.gitconfig`: 기본 Git 설정 파일.

## ⚠️ 주의사항

- 설치 중 Termux가 저장소 접근 권한을 요청할 수 있습니다. 팝업이 뜨면 **허용**을 눌러주세요.
- 설치 완료 후 폰트와 테마가 제대로 적용되려면 Termux 앱을 재시작해야 합니다.
