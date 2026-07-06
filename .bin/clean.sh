#!/bin/bash
#
# Clean tools that accumulate large caches

rm -rf ~/.cache/pip/*

mise cache clear
pulumi plugin rm --all --yes
uv cache clean
yarn cache clean
yay -Sc --noconfirm

docker builder prune
