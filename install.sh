#!/bin/bash

source /etc/os-release

if [[ $ID_LIKE == *"arch"* ]]; then
    sudo pacman -S neovim yay alacritty tmux git base-devel
else
    echo "Distro not supported"
fi

echo "Cloning TPM"
tpm_dir="~/.config/tmux/tpm"
git clone https://github.com/tmux-plugins/tpm $tpm_dir
echo "TPM Cloned"

echo "Installing z"
git clone https://github.com/rupa/z.git
echo "z Installed"
