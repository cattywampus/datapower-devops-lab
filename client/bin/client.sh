#!/bin/bash

# Loop for up to 20 consecutive failures
for (( failures=0; failures<20; ))
do
  rcsum=0
  for url in "$@"
  do
    echo "vvvv curl $url vvvv"
    curl -f -k -s "$url"
    rc=$?
    rcsum=$((rcsum + rc))
    echo "^^^^ curl $url ^^^^ rc=$rc"
  done

  if [ $rcsum = 0 ]
  then
    failures=0
    if [ ! "$CONTINUOUS" = "true" ]
    then
      echo SUCCESS
      break
    fi
  else
    failures=$((failures + 1))
    echo FAILURE $failures rc=$rcsum
  fi
  # otherwise wait a second and try again
  sleep 5
done

exit $rcsum
