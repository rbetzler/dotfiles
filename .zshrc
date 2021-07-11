
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="fino"

plugins=(git dotenv zsh-autosuggestions zsh-syntax-highlighting)

# dbt autocomplete
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/dbt-autocomplete/.dbt-completion.bash
fpath=(~/dbt-autocomplete/_dbt $fpath)

source $ZSH/oh-my-zsh.sh

# source dirs
DIRS=(creds_db creds_dbt general scripts work)
for d in $DIRS; do
  for f in ~/."$d"/*; do
    source $f;
  done
done

# custom dbt functions
source ${HOME}/.dbt/dbt_utils

# activate home python venv
source ${HOME}/.python/venv/bin/activate

# ipython env
export IPYTHONDIR="$HOME"/.ipython

# aliases
alias c="bat"
alias dk="docker"
alias g="git"
alias h="hub"
alias l="exa"
alias m="mutt"
alias mr="mutt -R"  # Mutt in read only mode
alias v="vim"
