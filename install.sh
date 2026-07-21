#!/bin/bash

set -e

OS="$(uname)"

install_brew() {
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Installing Homebrew..."

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add brew to PATH automatically
        if [[ -f /opt/homebrew/bin/brew ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -f /usr/local/bin/brew ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi

        echo "Homebrew installed!"
    else
        echo "Homebrew already installed"
    fi
}

install_starship() {
    echo "Installing starship prompt"

    if command -v brew &> /dev/null; then
        brew install starship
    else
        curl -sS https://starship.rs/install.sh | sh -s -- -y
    fi
}

install_common_tools() {
    install_starship

    echo "Cloning TPM"
    tpm_dir="$HOME/.tmux/plugins/tpm"

    if [[ ! -d "$tpm_dir" ]]; then
        git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
    else
        echo "TPM already installed"
    fi

    echo "Installing z"
    if [[ ! -d "$HOME/z" ]]; then
        git clone https://github.com/rupa/z.git "$HOME/z"
    else
        echo "z already installed"
    fi

    if ! grep -q "source \$HOME/z/z.sh" "$HOME/.zshrc" 2>/dev/null; then
        echo 'source $HOME/z/z.sh' >> "$HOME/.zshrc"
    fi

    echo "Configuring zsh"
    chsh -s "$(which zsh)" || true

    echo "Installing Oh My Zsh"

    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "Oh My Zsh already installed"
    fi

    echo "Installing zsh plugins"

    ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions \
            "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    else
        echo "zsh-autosuggestions already installed"
    fi

    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    else
        echo "zsh-syntax-highlighting already installed"
    fi
}

if [[ "$OS" == "Darwin" ]]; then
    echo "Detected macOS"

    install_brew

    echo "Installing packages with Homebrew..."

    brew install \
        neovim \
        tmux \
        git \
        ripgrep \
        zsh \
        fzf \
        fd \
        bat \
        lazygit \
        eza \
        starship

    brew install --cask alacritty

elif [[ "$OS" == "Linux" ]]; then

    source /etc/os-release

    if [[ $ID_LIKE == *"arch"* ]]; then
        echo "Installing packages for Arch-based system..."

        sudo pacman -Sy --needed \
            neovim \
            alacritty \
            tmux \
            git \
            base-devel \
            ripgrep \
            zsh \
            fzf \
            fd \
            bat \
            lazygit \
            eza

    elif [[ $ID_LIKE == *"debian"* ]] || [[ $ID == "ubuntu" ]]; then
        echo "Installing packages for Debian/Ubuntu-based system..."

        sudo apt update

        sudo apt install -y \
            neovim \
            tmux \
            git \
            build-essential \
            zsh \
            ripgrep \
            curl \
            fzf \
            fd-find \
            bat

        # Install Alacritty
        if ! command -v alacritty &> /dev/null; then
            echo "Installing Alacritty..."

            sudo add-apt-repository ppa:aslatter/ppa -y
            sudo apt update
            sudo apt install -y alacritty
        fi

        # Install eza
        if ! command -v eza &> /dev/null; then
            echo "Installing eza..."

            sudo mkdir -p /etc/apt/keyrings

            wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
                | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg

            echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] \
http://deb.gierens.de stable main" \
                | sudo tee /etc/apt/sources.list.d/gierens.list

            sudo chmod 644 /etc/apt/keyrings/gierens.gpg \
                /etc/apt/sources.list.d/gierens.list

            sudo apt update
            sudo apt install -y eza
        fi

        # Install lazygit
        if ! command -v lazygit &> /dev/null; then
            echo "Installing lazygit..."

            LAZYGIT_VERSION=$(curl -s \
                "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" \
                | grep -Po '"tag_name": "v\K[^"]*')

            curl -Lo lazygit.tar.gz \
                "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

            tar xf lazygit.tar.gz lazygit

            sudo install lazygit -D -t /usr/local/bin/

            rm -f lazygit lazygit.tar.gz
        fi

    else
        echo "Distro not supported"
        exit 1
    fi
else
    echo "Unsupported OS"
    exit 1
fi

install_common_tools

echo ""
echo "Installation complete! 🚀"
echo ""

# Ubuntu aliases
if [[ "$OS" == "Linux" ]]; then
    if command -v fdfind &> /dev/null; then
        grep -q 'alias fd="fdfind"' ~/.zshrc 2>/dev/null || \
            echo 'alias fd="fdfind"' >> ~/.zshrc
    fi

    if command -v batcat &> /dev/null; then
        grep -q 'alias bat="batcat"' ~/.zshrc 2>/dev/null || \
            echo 'alias bat="batcat"' >> ~/.zshrc
    fi
fi

echo "Restart your terminal or run:"
echo "source ~/.zshrc"
