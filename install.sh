#!/bin/bash

set -exuo pipefail

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

config_files=(
    .gitconfig
    .tmux.conf
    .emacs
    .vimrc
    .config/foot
    .config/waybar
    .config/sway
    .config/rofi
)

for config_file in ${config_files[@]}; do
    if [ -L ~/$config_file ]; then
	rm ~/$config_file
    elif [ -e ~/$config_file ]; then
	mv ~/$config_file ~/${config_file}_back
    fi

    ln -sf $cur_dir/$config_file ~/$config_file
done


