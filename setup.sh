#!/bin/sh
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/karabiner
mkdir -p ~/.config/git
ln -sf ~/dotfiles/gitignore ~/.config/git/ignore
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.xvimrc ~/.xvimrc
ln -sf ~/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ~/dotfiles/hammerspoon/ ~/.hammerspoon
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/helix/config.toml ~/.config/helix/config.toml
ln -sf ~/dotfiles/.wezterm.lua ~/.wezterm.lua

if [ "$(uname)" == 'Darwin' ]; then
    ln -sf ~/dotfiles/.Brewfile ~/.Brewfile
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    ln -sf ~/dotfiles/xkeysnail/xkeysnail.desktop ~/.config/autostart/xkeysnail.desktop
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi
