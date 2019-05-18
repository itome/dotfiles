#!/bin/sh
ln -sf ~/dotfiles/.profile ~/.profile

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.xvimrc ~/.xvimrc

ln -sf ~/dotfiles/karabiner ~/.config/karabiner
ln -sf ~/dotfiles/peco-config.json ~/.config/peco/config.json

ln -sf ~/dotfiles/.zshrc ~/.zshrc

ln -sf ~/dotfiles/xkeysnail/xkeysnail.desktop ~/.config/autostart/xkeysnail.desktop

chmod +x ~/dotfiles/commands/*
