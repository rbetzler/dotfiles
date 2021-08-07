
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="fino"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  # zsh-vi-mode
)

# dbt autocomplete
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/dbt-autocomplete/.dbt-completion.bash
fpath=(~/dbt-autocomplete/_dbt $fpath)

source $ZSH/oh-my-zsh.sh

# source dirs with creds, configs, scripts
DIRS=(creds_db creds_dbt general work)
for d in $DIRS; do
  for f in ~/."$d"/*; do
    source $f;
  done
done

# activate home python venv
source ${HOME}/.python/venv/bin/activate

# ipython env
export IPYTHONDIR="$HOME"/.ipython

# Set zsh vi mode to lazy start
# to speed startup
ZVM_LAZY_KEYBINDINGS=false

# aliases
alias b="bat"
alias c="bat"
alias dk="docker"
alias fcat='bat $(fz)'
alias fd="fdfind"
alias fvim='vim $(fz)'
alias fz="fzf --height 60%"
alias g="git"
alias h="hub"
alias l="exa"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -al"
alias m="mutt"
alias mr="mutt -R"  # Mutt in read only mode
alias v="vim"
