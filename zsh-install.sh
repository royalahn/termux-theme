#!/bin/bash

# Install oh-my-zsh
echo -e "\n\n# Install oh-my-zsh\n\n"

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

chsh -s $(which zsh)

# Change oh-my-zsh theme to to agnoster
echo -e "\n\n# Change oh-my-zsh theme to to agnoster\n\n"

echo "sed -i 's/robbyrussell/agnoster/' ~/.zshrc"

sed -i 's/robbyrussell/agnoster/' ~/.zshrc

# Install oh-my-zsh plugins
echo -e "\n\n# Install oh-my-zsh plugins\n\n"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Update .zshrc to use plugins
echo -e "\n\n# Update .zshrc to use plugins\n\n"

echo "sed -i 's/(git)/(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)/' ~/.zshrc"
sed -i 's/(git)/(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)/' ~/.zshrc

# Done
echo -e "\n\n# Done\n\n"

exit
