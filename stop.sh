#!/usr/bin/env bash

source ./run.sh . dry

docker compose \
  --env-file ./.env \
  ${ARGS[@]} \
  down \
  --remove-orphans \
  --timeout 15 \
  --volumes 

docker compose \
  --env-file ./.env \
  ${ARGS[@]} \
  rm \
  --force \
  --stop \
  --volumes 

rm ./server-overrides.yml
