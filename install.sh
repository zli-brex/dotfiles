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

echo "Importing IntelliJ host settings..."
mkdir -p ~/.config/JetBrains/RemoteDev-IU/_home_owner_src_credit_card/
unzip -o settings.zip -d ~/.config/JetBrains/RemoteDev-IU/_home_owner_src_credit_card/

echo "Installing IntelliJ host plugins..."
~/.cache/JetBrains/RemoteDev/dist/ideaIU-2023.2.2/bin/remote-dev-server.sh installPlugins ~/src/credit_card $(cat ~/.config/JetBrains/RemoteDev-IU/_home_owner_src_credit_card/installed.txt)

