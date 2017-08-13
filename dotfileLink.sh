#!/bin/sh
ln -sf ~/dotfiles/.spacemacs ~/.spacemacs
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/fish ~/.config/
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.jsbeautifyrc ~/.jsbeautifyrc
ln -sf ~/dotfiles/.tern-config ~/.tern-config
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.jshintrc ~/.jshintrc

## to support fish shell in emacs
tic -o ~/.terminfo $TERMINFO/e/eterm-color.ti
