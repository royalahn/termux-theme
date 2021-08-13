#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage

apt update
apt install -y git zsh vim

mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "./.termux" "$HOME/.termux"

git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

sed -i '/^plugins=(git)/d' "$HOME/.zshrc"
sed -i '1iplugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)' "$HOME/.zshrc"

chsh -s zsh

echo "Please restart Termux app..."

exit
