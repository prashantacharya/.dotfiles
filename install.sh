#!/bin/bash

source /etc/os-release

if [[ $ID_LIKE == *"arch"* ]]; then
    echo "Installing packages for Arch-based system..."
    sudo pacman -S neovim alacritty tmux git base-devel ripgrep
elif [[ $ID_LIKE == *"debian"* ]] || [[ $ID == "ubuntu" ]]; then
    echo "Installing packages for Debian/Ubuntu-based system..."
    sudo apt update
    sudo apt install -y neovim tmux git build-essential zsh ripgrep
    
    # Install Alacritty (it's not in the default Ubuntu repositories)
    if ! command -v alacritty &> /dev/null; then
        echo "Installing Alacritty..."
        sudo add-apt-repository ppa:aslatter/ppa -y
        sudo apt update
        sudo apt install -y alacritty
    fi
else
    echo "Distro not supported"
    exit 1
fi

echo "Installing starship prompt"
curl -sS https://starship.rs/install.sh | sh

echo "Cloning TPM"
tpm_dir="$HOME/.config/tmux/plugins/"
mkdir -p "$(dirname "$tpm_dir")"
git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
echo "TPM Cloned"

echo "Installing z"
git clone https://github.com/rupa/z.git "$HOME/z"
echo "source $HOME/z/z.sh" >> "$HOME/.bashrc"
echo "z Installed"

echo "Configuring zsh"
chsh -s $(which zsh)

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

source ~/.zshrc

echo "Installing required plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installation complete!"
