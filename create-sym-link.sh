echo "Creating symbolink for Neovim configuration"
ln -s nvim ~/.config/nvim

echo "Creating symbolink for Tmux configuration"
ln -s .tmux.conf ~/.tmux.conf

echo "Creating symlink for .zshrc"
ln -s .zshrc ~/.zshrc
