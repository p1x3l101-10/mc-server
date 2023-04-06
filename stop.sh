#!/bin/bash

source ./run.sh . dry

exec docker compose ${ARGS[@]} down \
  --remove-orphans \
  --rmi all \
  --timeout 15 \
  --volumes 
