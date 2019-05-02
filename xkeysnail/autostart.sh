#!/usr/bin/env bash
xhost +SI:localuser:xkeysnail
sudo -u xkeysnail DISPLAY=$DISPLAY xkeysnail ~/dotfiles/xkeysnail/config.py &
