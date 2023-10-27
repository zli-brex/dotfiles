#!/bin/sh

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing zhjngli env..."
git clone https://github.com/zhjngli/env.git
./env/env.sh --install
