mydir=$(pwd)

echo "Creating symlink for Neovim configuration"
ln -sfn $mydir/nvim ~/.config/nvim

echo "Creating symlink for Tmux configuration"
ln -sfn $mydir/tmux ~/.config/tmux

echo "Creating symlink for .zshrc"
echo "Creating backup for existing zsh config"
mv ~/.zshrc ~/.zshrc-backup
ln -sfn $mydir/.zshrc ~/.zshrc

echo "Creating symlink for alacritty"
ln -sfn $mydir/alacritty ~/.config/alacritty

echo "Create symlink for Wezterm"
ln -sfn $mydir/wezterm ~/.config/wezterm
