#!/bin/sh
mkdir -p ~/.config/alacritty
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.xvimrc ~/.xvimrc
ln -sf ~/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf ~/dotfiles/peco-config.json ~/.config/peco/config.json
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

if [ "$(uname)" == 'Darwin' ]; then
    ln -sf ~/dotfiles/.Brewfile ~/.Brewfile
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    ln -sf ~/dotfiles/xkeysnail/xkeysnail.desktop ~/.config/autostart/xkeysnail.desktop
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

chmod +x ~/dotfiles/commands/*
