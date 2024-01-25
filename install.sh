#!/bin/bash

source /etc/os-release

if [[ $ID_LIKE == *"arch"* ]]; then
    sudo pacman -S neovim yay alacritty tmux
else
    echo "Distro not supported"
fi

tpm="~/.config/tmux/tpm"
git clone https://github.com/tmux-plugins/tpm $tmux_dir
