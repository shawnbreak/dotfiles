#!/bin/bash

cur_dir=$(dirname $(readlink -f "$0"))
echo $cur_dir

# .bashrc
if ! grep "$cur_dir/.bashrc" ~/.bashrc; then
    cat >> ~/.bashrc <<EOF
if [ -f $cur_dir/.bashrc ]; then
  source $cur_dir/.bashrc
fi
EOF
fi

# - .zshrc  -- deprecated

# - .gitconfig

ln -sf $cur_dir/.gitconfig ~/.gitconfig

# - .tmux.conf
ln -sf $cur_dir/.tmux.conf ~/.tmux.conf

# - .emacs
ln -sf $cur_dir/.emacs ~/.emacs
# - .vimrc
# - .config/alacritty
# - .config/clash
# - .config/Code
# - .config/fontconfig
# - .config/ghostty
# - .config/kitty
# - .config/nvim
# - .config/waybar
# - .config/sway
# - .config/starship.toml
# - .config/wofi

