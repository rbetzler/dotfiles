
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="dracula"
DRACULA_DISPLAY_CONTEXT=1  # print username too

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# dbt autocomplete
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/dbt-autocomplete/.dbt-completion.bash
fpath=(~/dbt-autocomplete/_dbt $fpath)

source $ZSH/oh-my-zsh.sh

source $HOME/dracula/zsh-syntax/zsh-syntax-highlighting.sh

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

# Patch slow git autosuggestions
# https://stackoverflow.com/questions/9810327/zsh-auto-completion-for-git-takes-significant-amount-of-time-can-i-turn-it-off/9810485#9810485
__git_files () {
    _wanted files expl 'local files' _files
}

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
alias mdrft="neomutt -f ~/.mutt/$MUTT_USER/\[Gmail\]/Drafts"
alias mr="neomutt -R -f ~/.mutt/$MUTT_USER/\[Gmail\]/All\ Mail/"  # Mutt in read only mode
alias ms="neomutt -f ~/.mutt/$MUTT_USER/\[Gmail\]/Sent\ Mail/"
alias s="sync_current_mailbox"
alias v="vim"
