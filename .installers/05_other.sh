#!/bin/bash

set -euxo pipefail

# Install vim plug for neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install git lfs
curl -LO https://github.com/git-lfs/git-lfs/releases/download/v3.4.1/git-lfs-linux-amd64-v3.4.1.tar.gz
tar -xf git-lfs-linux-amd64-v3.4.1.tar.gz
sudo bash git-lfs-3.4.1/install.sh

# Install zen browser
wget https://github.com/zen-browser/desktop/releases/download/1.0.0-a.39/zen.linux-specific.tar.bz2 -O "${HOME}/Downloads/zen.tar.bz2"
tar xjf "${HOME}/Downloads/zen.tar.bz2"
sudo mv zen /opt/
# Grab desktop icon manually
curl https://cdn.jsdelivr.net/gh/zen-browser/www/public/logos/zen-black.svg | sudo tee /usr/share/icons/zen-black.svg
