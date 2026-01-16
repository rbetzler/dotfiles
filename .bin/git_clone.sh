#!/bin/bash
#
# Add a normal repo and worktrees.
# Needed if using `act` to run github actions locally.

set -euxo pipefail

REPO_NAME="$(basename -s .git "$1")"
mkdir "$REPO_NAME"
cd "$REPO_NAME"

git clone "$1"

cd "$REPO_NAME"

git fetch

# Common worktree conventions
git worktree add ../01_primary origin/main --detach
# git worktree add ../02_development origin/development --detach
# git worktree add ../03_staging origin/staging --detach
git worktree add ../09_scratch origin/main --detach
git worktree add ../88_vm origin/main --detach
git worktree add ../99_ephemeral origin/main --detach
