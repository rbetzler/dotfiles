
export ZSH="/Users/rickbetzler/.oh-my-zsh"

ZSH_THEME="jonathan"

plugins=(git dotenv)

# dbt autocomplete
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/.dbt-completion.bash
fpath=(~/_dbt $fpath)

source $ZSH/oh-my-zsh.sh

