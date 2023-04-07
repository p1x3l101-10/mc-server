#!/bin/bash

instance="$1"
shift

FILES=(
  'overrides/undefined-volumes.yml'
  'compose.yml'
#  'overrides/rcon-webserver.yml'
  'overrides/server-overrides.yml'
)

for file in ${FILES[@]}; do
  if [[ -f $file ]]; then
    FILE_ARGS=( ${FILE_ARGS[@]} '--file' "$file" )
  fi
done

ARGS=( ${FILE_ARGS[@]} ${ARGS[@]} )

if [[ $1 != "dry" ]]; then
  if [[ ! -f "./instances/$instance/overrides.yml" ]]; then
    echo "$instance is not a valid instance!"
    exit 1
  fi

  ln -sf ../instances/$instance/overrides.yml ./overrides/server-overrides.yml

  exec docker-compose \
    --env-file ./.env \
    ${ARGS[@]} \
    up -d
fi
