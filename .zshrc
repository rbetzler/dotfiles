
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="fino"

plugins=(git dotenv)

# dbt autocomplete
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/dbt-autocomplete/.dbt-completion.bash
fpath=(~/dbt-autocomplete/_dbt $fpath)

source $ZSH/oh-my-zsh.sh

# source dirs
DIRS=(db_creds dbt_creds work)
for d in $DIRS; do
  for f in ~/."$d"/*; do
    source $f;
  done
done

# custom dbt functions
source ${HOME}/.dbt/dbt_utils

# activate home python venv
source ${HOME}/.python/venv/bin/activate
