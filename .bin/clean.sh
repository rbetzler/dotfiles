#!/bin/bash
#
# Clean tools that accumulate large caches

rm -rf ~/.cache/pip/*

mise cache clear
pulumi plugin rm --all --yes
uv cache clean
yarn cache clean
yay -Sc --noconfirm

sudo journalctl --vacuum-size=50M
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc

docker system prune --all --force
