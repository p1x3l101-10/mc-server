#!/bin/bash

source ./run.sh . dry

exec docker compose \
  --env-file ./.env \
  ${ARGS[@]} \
  down \
  --remove-orphans \
  --timeout 15 \
  --volumes 
