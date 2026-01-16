#!/bin/bash
#
# Add repos with a bare root repo, rather than a normal one.

set -euxo pipefail

REPO_NAME="$(basename -s .git "$1")"
mkdir "$REPO_NAME"
cd "$REPO_NAME"

git clone --bare "$1" ./00_repo.git

cd ./00_repo.git

# Set origin
git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'

git fetch

# Delete all branches
git for-each-ref --format='%(refname:short)' refs/heads | xargs git branch -D

# Common worktree conventions
# git worktree add ../01_primary origin/main --detach
# git worktree add ../09_scratch origin/main --detach
