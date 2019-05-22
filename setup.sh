#!/bin/sh
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.xvimrc ~/.xvimrc
ln -sf ~/dotfiles/karabiner ~/.config/karabiner
ln -sf ~/dotfiles/peco-config.json ~/.config/peco/config.json
ln -sf ~/dotfiles/.zshrc ~/.zshrc

if [ "$(uname)" == 'Darwin' ]; then
    ln -sf ~/dotfiles/.Brewfile ~/.Brewfile
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    ln -sf ~/dotfiles/xkeysnail/xkeysnail.desktop ~/.config/autostart/xkeysnail.desktop
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

chmod +x ~/dotfiles/commands/*
