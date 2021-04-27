#!/bin/bash

spin_up_dockerized_postgres()
{
  source ~/.creds_db/example
  docker run -d --rm -p $PGPORT:$PGPORT -e POSTGRES_PASSWORD=$PGPASSWORD --network bridge postgres
  echo 'Sleeping while postgres spins up'
  sleep 5
  echo 'Connecting to db'
  psql
}

