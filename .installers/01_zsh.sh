#!/bin/bash

set -euxo pipefail

# Switch default shell to zsh
chsh -s "$(which zsh)"

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symbolic link for zsh theme
ln -s "${HOME}/dracula/zsh/dracula.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/dracula.zsh-theme"

# Reset zshrc
git checkout "$HOME/.zshrc"
