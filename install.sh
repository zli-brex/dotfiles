#!/bin/sh

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "Installing vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "chsh to zsh..."
sudo chsh $USER -s $(which zsh)

echo "Installing zhjngli env..."
git clone https://github.com/zhjngli/env.git
cd env
git apply --ignore-space-change --ignore-whitespace ../env.patch
./env.sh --install git vimrc zsh-theme zshrc
cd -
