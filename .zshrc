
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="dracula"
DRACULA_DISPLAY_CONTEXT=1  # print username too

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
  docker
  docker-compose
)

# dbt autocomplete
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/dbt-autocomplete/.dbt-completion.bash
fpath=(~/dbt-autocomplete/_dbt $fpath)

source $ZSH/oh-my-zsh.sh

source $HOME/dracula/zsh-syntax/zsh-syntax-highlighting.sh

source /usr/share/autojump/autojump.zsh

# source every non-readme file in the following dirs
# which contain creds, configs, scripts
DIRS=(creds_db creds_dbt creds_mutt general work)
for d in $DIRS; do
  for f in ~/."$d"/*; do
    if [ "${f: -3}" != ".md" ] && [ "${f: -7}" != ".ignore" ]; then
      source $f;
    fi
  done
done

# activate home python venv
source ${HOME}/.python/venv/bin/activate

# ipython env
export IPYTHONDIR="$HOME"/.ipython

# Zsh vi mode cursor configs
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

# Key binds to override zsh vi mode
zvm_bindkey viins "^[[H" beginning-of-line
zvm_bindkey viins "^[[F" end-of-line

# Patch slow git autosuggestions
# https://stackoverflow.com/questions/9810327/zsh-auto-completion-for-git-takes-significant-amount-of-time-can-i-turn-it-off/9810485#9810485
__git_files () {
    _wanted files expl 'local files' _files
}

# Patch inconsistent bat, batcat naming
if ! type bat &>/dev/null ; then
  alias bat="batcat"
fi

# Most aliases
# Mutt aliases exist in .general/mutt
alias b="bat"
alias c="bat"
alias dk="docker"
alias fc='bat $(fz)'
alias fd="fdfind"
alias fv='vim $(fz)'
alias fz="fzf --height 60%"
alias g="git"
alias l="exa"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -al"
alias s="sync_current_mailbox"
alias t="tre -e"
alias v="vim"
