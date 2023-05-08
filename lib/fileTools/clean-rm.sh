#!/usr/bin/env bash

if [[ -e $1 ]]; then
  rm -r $1
else
  echo "$1 does not exist!"
fi
