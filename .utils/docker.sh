#!/bin/bash

dkrmf-all(){
  docker rm -f $(docker ps -aq)
}

dkrmif-all(){
  docker rmi -f $(docker images -q)
}

dkstp-all(){
  docker stop $(docker ps -q)
}

dkstp-rm-rmi-all(){
  docker stop $(docker ps -aq)
  dkrm-all
  dkrmi-all
}

alias dki="docker images"
alias dkk="docker kill"
alias dkpl="docker pull"
alias dkps="docker ps"
alias dkpsa="docker ps -a"
alias dkpsaq="docker ps -aq"
alias dkrm="docker rm"
alias dkrmf="docker rm -f"
alias dkrmi="docker rmi"
alias dkrmif="docker rmi -f"
alias dkstp="docker stop"

alias mk="minikube"
alias k="kubectl"
alias hl="helm"

# Spin up docker postgres db
dkpsql(){
  docker run -d --rm -p $PGPORT:$PGPORT -e POSTGRES_PASSWORD=$PGPASSWORD --network bridge postgres
}

# Spin up docker clickhouse db
# Optionally specify directory
dkch() {
  if [ $# -eq 0 ]; then
    CH_DIR=$(mktemp -d -p "$HOME/Documents/chdatadk/")
  else
    CH_DIR=$1
  fi
  docker run -d \
    -p 8123:8123 \
    -p 9000:9000 \
    --ulimit nofile=262144:262144 \
    -e CLICKHOUSE_PASSWORD="$CH_PASSWORD" \
    -v "$CH_DIR:/var/lib/clickhouse/" \
    "clickhouse/clickhouse-server:$(clickhouse-client --version-clean)"
}
