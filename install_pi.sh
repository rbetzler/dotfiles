#!/bin/bash

# Install vim-gtk for pi
apt-get install vim-gtk

# Install ctags
apt-get install ctags

# Clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install dbt autocomplete
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/dbt-completion.bash > ~/.dbt-completion.bash
# TODO: Move bash_profile to dotfiles
echo 'source ~/.dbt-completion.bash' >> ~/.bash_profile

