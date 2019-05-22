#!/bin/sh

# Homebrew
xcode-select --install
if !(type "brew" > /dev/null 2>&1); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew bundle --file ~/dotfiles/Brewfile

# rust
if !(type "cargo" > /dev/null 2>&1); then
    curl https://sh.rustup.rs -sSf | sh
fi

# nvm
if !(type "nvm" > /dev/null 2>&1); then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
fi
