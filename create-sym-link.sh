mydir=$(pwd)

echo "Creating symlink for Neovim configuration"
ln -s $mydir/nvim ~/.config/nvim

echo "Creating symlink for Tmux configuration"
ln -s $mydir/tmux ~/.config/tmux

echo "Creating symlink for .zshrc"
echo "Creating backup for existing zsh config"
mv ~/.zshrc ~/.zshrc-backup
ln -s $mydir/.zshrc ~/.zshrc

echo "Creating symlink for alacritty"
ln -s $mydir/alacritty ~/.config/alacritty

