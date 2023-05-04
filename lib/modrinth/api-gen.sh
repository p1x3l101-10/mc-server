#!/usr/bin/env bash

API_BRANCH=""
API_VERSION="v2"

printf "https://"
if [[ $API_BRANCH != "" ]];then
  printf "$API_BRANCH-"
fi
printf "api.modrinth.com/$API_VERSION"
printf "\n"
