#!/bin/bash
#
# Helper script for vim to run queries
#   All configs must be in the default
#   shell env. Otherwise, meh.
#
# Arguments
#   DATABASE_TYPE
#   FILE_NAME

DATABASE_TYPE="$1"
FILE_NAME="$2"

if [ $DATABASE_TYPE = "pg" ] ; then
  cat "$FILE_NAME" | psql -qH | pandoc -f html -t gfm
fi
