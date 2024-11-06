#!/bin/bash
# setup.sh
# Copyright (c) 2024 [balauka]

# Version: 1.0.0
# Date: 2024-11-06
# Description: This script will setup neovim config, from the ../config folder
#
# Feel free to change anything!

if ! command -v nvim &> /dev/null; then
  echo "NeoVim does not installed. Please, install it first!"
  exit 1
fi

if [ -d "~/.config/nvim" ]; then
    read -p "You already have a NeoVim config, do you want to save it? (y/n)" save

    if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
        echo "Start saveing your config in: ~/.config/nvim-backup"
        mkdir -p "~/.config/nvim-backup/$(date +%Y-%m-%d)"
        mv ~/.config/nvim/* "~/.config/nvim-backup/$(date +%Y-%m-%d)"
    fi
    rm -rf ~/.config/nvim
fi

mkdir ~/.config/nvim
mv ../config/* ~/.config/nvim/
echo "Start PackerSync..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo "Your NeoVim is ready to user!"
