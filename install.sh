#!/data/data/com.termux/files/usr/bin/bash

# Colors
NC="\e[0m"              # No Color
BLACK='\e[1;30m'        # Black
RED='\e[1;31m'          # Red
GREEN='\e[1;32m'        # Green
YELLOW='\e[1;33m'       # Yellow
BLUE='\e[0;34m'         # Blue
PURPLE='\e[1;35m'       # Purple
CYAN='\e[1;36m'         # Cyan
WHITE='\e[1;37m'        # White

# Functions
error   () { echo -e "${RED}${*}${NC}";exit 1;:; }
warning () { echo -e "${YELLOW}${*}${NC}";:; }
info    () { echo -e "${GREEN}-----";echo -e "# ${*}";echo -e "-----${NC}";:; }
log     () { echo -e "${BLUE}${*}${NC}";:; }

# termux-setup-storage
info "termux-setup-storage"

log "termux-setup-storage"
termux-setup-storage

# Install used programs
info "Install used programs"

log "apt install -y git zsh vim screenfetch neofetch openssh sshpass htop"
apt update
apt install -y git zsh vim screenfetch neofetch openssh sshpass htop

# Copy termux theme and font
info "Copy termux theme and font"

mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "./.termux" "$HOME/.termux"

# Install oh-my-zsh
info "Install oh-my-zsh"

git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"

# Change theme to agnoster
info "Change theme to agnoster"

log "sed -i 's/robbyrussell/agnoster/' ~/.zshrc"
sed -i 's/robbyrussell/agnoster/' ~/.zshrc

# Change prompt_context
info "Change prompt_context"

log "echo 'prompt_context() {}' >> ~/.zshrc"
echo 'prompt_context() {}' >> ~/.zshrc

# Install oh-my-zsh plugins
info "Install oh-my-zsh plugins"

log "zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting --depth 1

log "zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions --depth 1

log "zsh-completions"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions --depth 1

# Use plugins
info "Use plugins"

log "sed -i 's/(git)/(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)/' ~/.zshrc"
sed -i 's/(git)/(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)/' ~/.zshrc

# Change shell to zsh
info "Change shell to zsh"

log "chsh -s zsh"
chsh -s zsh

# Copy git config
info "Copy git config"

log "cp .gitconfig '$HOME'"
cp .gitconfig "$HOME"

# Copy vim config
info "Copy vim config"

log "cp .vimrc '$HOME'"
cp .vimrc "$HOME"

# Set alias
info "Set alias"

echo 'alias ssh1="sshpass -p password ssh user@localhost"' >> ~/.zshrc

# Done
warning "Please restart Termux"

exit
