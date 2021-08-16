#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage

echo -e "\n\n# Install used programs\n\n"

apt update
apt install -y git zsh vim screenfetch neofetch openssh sshpass htop

echo -e "\n\n# Copy theme and font\n\n"

mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "./.termux" "$HOME/.termux"

echo -e "\n\n# Install oh-my-zsh\n\n"

git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"

echo -e "\n\n# Update .zshrc to change theme to agnoster\n\n"

sed -i 's/robbyrussell/agnoster/' ~/.zshrc

echo -e "\n\n# Install oh-my-zsh plugins\n\n"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

echo -e "\n\n# Update .zshrc to use plugins\n\n"

sed -i 's/(git)/(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)/' ~/.zshrc

echo -e "\n\n# Change shell to zsh\n\n"

chsh -s zsh

echo -e "\n\n# Copy git config\n\n"

cp .gitconfig "$HOME"

echo -e "# Please restart Termux"

exit
