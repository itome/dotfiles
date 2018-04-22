#!/bin/sh
ln -sf ~/dotfiles/.profile ~/.profile
# custom layers for spacemacs
ln -sf ~/dotfiles/.spacemacs.d/private/ ~/.emacs.d/private/
ln -sf ~/dotfiles/.spacemacs.d/init.el ~/.spacemacs

ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc

mkdir -p ~/.config/fish/functions
ln -sf ~/dotfiles/fish/functions/change_color.fish ~/.config/fish/functions/change_color.fish
ln -sf ~/dotfiles/fish/functions/peco_z.fish ~/.config/fish/functions/peco_z.fish
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish

ln -sf ~/dotfiles/.jsbeautifyrc ~/.jsbeautifyrc
ln -sf ~/dotfiles/.eslintrc ~/.eslintrc
ln -sf ~/dotfiles/.tern-config ~/.tern-config
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.jshintrc ~/.jshintrc
ln -sf ~/dotfiles/peco-config.json ~/.config/peco/config.json

chsh -s `which fish`
