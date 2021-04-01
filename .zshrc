
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="fino"

plugins=(git dotenv)

# dbt autocomplete
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/dbt-autocomplete/.dbt-completion.bash
fpath=(~/dbt-autocomplete/_dbt $fpath)

source $ZSH/oh-my-zsh.sh

# load db, dbt creds
source ${HOME}/.db_creds/load.sh
source ${HOME}/.dbt_creds/load.sh

# load work creds, utils, etc
source ${HOME}/.work/load.sh

# activate home python venv
source ${HOME}/.python/venv/bin/activate
