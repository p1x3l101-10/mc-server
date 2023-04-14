#!/usr/bin/env bash

source ./run.sh . dry

rm ./server-overrides.yml

exec docker compose \
  --env-file ./.env \
  ${ARGS[@]} \
  down \
  --remove-orphans \
  --timeout 15 \
  --volumes 
