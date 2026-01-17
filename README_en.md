[Korean](README.md) | [English](README_en.md)

# Termux Theme & Utilities Installer

This project is an automated script that transforms the Android **Termux** environment into a beautiful and efficient
development environment. It installs and configures Zsh, Oh My Zsh, Powerline fonts, and useful plugins and tools all at
once.

## ✨ Features

Running this script automatically installs and configures the following items:

### 1. Shell & Theme

- **Zsh**: Changes the default shell to Zsh.
- **Oh My Zsh**: Installs a framework to manage Zsh configuration.
- **Agnoster Theme**: Applies a Powerline-based theme that offers good readability and shows Git status clearly.
- **Powerline Fonts**: Applies special fonts to ensure the theme looks beautiful and doesn't break.
- **Color Scheme**: Applies the **Snazzy** color scheme to Termux for a comfortable viewing experience.

### 2. Powerful Plugins

Includes core Zsh plugins to boost productivity.

- **zsh-autosuggestions**: Suggests commands in real-time based on your command history.
- **zsh-syntax-highlighting**: highlights commands in different colors to indicate if they are valid or not.
- **zsh-completions**: Provides additional tab completion for various commands.
- **fzf**: Installs a Fuzzy Finder to find files in the terminal quickly and intuitively.

### 3. Essential Utilities

Installs necessary tools for development and system management.

- `git`, `vim`
- `openssh`, `sshpass` (SSH connection automation tool)
- `htop` (System monitoring)
- `wget`, `netcat-openbsd`
- `kubectl` (Kubernetes control tool)
- `screenfetch`, `neofetch` (System information display)

### 4. Configuration

- **Vim Configuration (`.vimrc`)**: Applies coding-optimized settings such as Syntax Highlighting, Line Number Display,
  Auto Indentation, etc.
- **Git Configuration**: Copies a predefined `.gitconfig` to set up a basic Git environment.
- **SSH Alias**: Sets up an `ssh1` alias for localhost connection (uses `sshpass`).

---

## 🚀 Installation

Run Termux and enter the following commands in order.

### Method 1: Full Installation (Recommended)

Installs all packages, configurations, and themes at once.

```bash
# Clone the repository
git clone https://github.com/royalahn/termux-theme.git

# Change directory
cd termux-theme

# Grant execution permission
chmod +x install.sh

# Run the installation script
./install.sh
```

Once installation is complete, **completely close and restart Termux**.

### Method 2: Setup Zsh & Theme Only (`zsh-install.sh`)

Use this if you already have the necessary packages installed or just want to configure the Zsh environment.

```bash
cd termux-theme
chmod +x zsh-install.sh
./zsh-install.sh
```

---

## 📂 File Structure Description

- `install.sh`: Full installation script. Performs package updates, program installation, and theme & font application.
- `zsh-install.sh`: Zsh configuration-only script. Quickly sets up Oh My Zsh and plugins only.
- `.termux/`: Directory containing Termux app configuration files (fonts, colors).
    - `colors.properties`: Snazzy color theme definition.
    - `font.ttf`, `alternative.ttf`: Powerline support fonts.
- `.vimrc`: Vim editor configuration file.
- `.gitconfig`: Basic Git configuration file.

## ⚠️ Notes

- During installation, Termux may request storage access permissions. Please click **Allow** if the popup appears.
- You must restart the Termux app after installation for the fonts and theme to be applied correctly.
