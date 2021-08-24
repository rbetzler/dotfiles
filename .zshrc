
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

# source every non-readme file in the following dirs
# which contain creds, configs, scripts
DIRS=(creds_db creds_dbt creds_mutt general work)
for d in $DIRS; do
  for f in ~/."$d"/*; do
    if [ "${f: -3}" != ".md" ]; then
      source $f;
    fi
  done
done

# activate home python venv
source ${HOME}/.python/venv/bin/activate

# ipython env
export IPYTHONDIR="$HOME"/.ipython

# Set zsh vi mode to lazy start to speed startup
# ZVM_LAZY_KEYBINDINGS=false

# Patch inconsistent bat, batcat naming
if ! type bat &>/dev/null ; then
  alias bat="batcat"
fi

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
alias m="neomutt -f ~/.mutt/$MUTT_USER/\[Gmail\]/All\ Mail/"
alias mr="neomutt -R -f ~/.mutt/$MUTT_USER/\[Gmail\]/All\ Mail/"  # Mutt in read only mode
alias ms="neomutt -f ~/.mutt/$MUTT_USER/\[Gmail\]/Sent\ Mail/"
alias v="vim"
