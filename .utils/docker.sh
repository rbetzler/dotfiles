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
spin_up_dockerized_postgres(){
  docker run -d --rm -p $PGPORT:$PGPORT -e POSTGRES_PASSWORD=$PGPASSWORD --network bridge postgres
  echo 'Sleeping while postgres spins up'
  sleep 5
  echo 'Connecting to db'
  pgcli
}

