#!/bin/bash
#
# Check if an ip address is public or private
if echo "$1" | grep --quiet -E '^(192\.168|10\.|172\.1[6789]\.|172\.2[0-9]\.|172\.3[01]\.)' ; then
  echo "Private: $1" ;
else
  echo "Public: $1" ;
fi
