#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage

echo -e "\n\nInstall zsh, git, vim etc \n\n"

apt update
apt install -y git zsh vim screenfetch openssh

mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "./.termux" "$HOME/.termux"

echo -e "\n\nInstall oh-my-zsh \n\n"

git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"

echo -e "\n\nInstall oh-my-zsh plugins \n\n"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

sed -i '/^plugins=(git)/d' "$HOME/.zshrc"
sed -i '1iplugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)' "$HOME/.zshrc"

echo -e "\n\nChange shell to zsh \n\n"

chsh -s zsh

echo -e "Please restart Termux"

exit
