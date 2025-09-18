#!/bin/bash

set -euxo pipefail

git clone --bare "$1" ./00_repo.git

cd ./00_repo.git

# Set origin
git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'

git fetch

# Delete all branches
git for-each-ref --format='%(refname:short)' refs/heads | xargs git branch -D
