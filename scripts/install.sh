#!/bin/bash
# install.sh
# Copyright (c) 2024 [balauka]

# Version: 1.0.0
# Date: 2024-11-04
# Description: This script will install neovim from the original repo, the installation folder is '/opt/nvim',
# and make it usable for all user by symlink it in the '/usr/local/bin/' as nvim
#
# Feel free to change anything!

if [ -d "/opt/nvim" ]; then
    # Ask if want to update
    read -p "NeoVim already installed, do you want to update it? (y/n): " answer

    if [[ "$answer" != "y" || "$answer" != "Y" ]]; then
        echo "Bye!"
        exit 0
    fi
    # Delete old files
    rm -rf /opt/nvim
    rm /usr/local/bin/nvim
fi

# Make a temp folder for install
mkdir /tmp/nvim-tmp
# Download NeoVim in the temp folder
cd /tmp/nvim-tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
# Untar the tar file in the '/opt/nvim' folder
tar -C /opt -xzf nvim-linux64.tar.gz
mv /opt/nvim-linux64 /opt/nvim
# Symlink it, to make it usable
ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
# Remove temp folder
rm -rf /tmp/nvim-tmp

