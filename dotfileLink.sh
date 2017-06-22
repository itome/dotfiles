#!/bin/sh
ln -sf ~/dotfiles/.spacemacs ~/.spacemacs
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/fish ~/.config/
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile

## to support fish shell in emacs
tic -o ~/.terminfo $TERMINFO/e/eterm-color.ti
