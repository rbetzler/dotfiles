#!/bin/bash

set -euxo pipefail

# Install yay
# May need to exit nix shell
cd "$HOME/repos/yay/"
makepkg -si

# Install aur packages
yay --sync --noconfirm google-cloud-cli
yay --sync --noconfirm google-cloud-cli-gke-gcloud-auth-plugin
yay --sync --noconfirm slack-desktop
yay --sync --noconfirm spotify
yay --sync --noconfirm zoom
yay --sync --noconfirm dracula-gtk-theme
yay --sync --noconfirm dracula-icons-git

# Also in nix
# yay autojump-rs
# yay tre-command
# yay vgrep

# Maybe
yay --sync --noconfirm zramswap
