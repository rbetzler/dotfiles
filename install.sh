
# Install zsh
apt-get install zsh

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Switch default shell to zsh
chsh -s $(which zsh)

# Install vim-gtk
apt-get install vim-gtk

# Install ctags
apt-get install ctags

# Install hub
apt-get install hub

# Install vgrep
# Check if this is preinstalled on ubuntu
# apt-get install vgrep

# Clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

# Install dbt autocomplete
mkdir ${HOME}/dbt-autocomplete
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/_dbt > ${HOME}/dbt-autocomplete/_dbt
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/dbt-completion.bash > ${HOME}/dbt-autocomplete/.dbt-completion.bash

# Install home python venv
sh ${HOME}/.python/install_venv

# CLone zsh syntax highlighting repo
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Clone zsh autocomplete repo
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
