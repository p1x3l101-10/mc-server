#!/usr/bin/env bash

instance="$1"
shift

OVERRIDES=(
  'force-redownload.yml'
)

for file in ${OVERRIDES[@]}; do
  if [[ -f "overrides/$file" ]]; then
    FILE_ARGS=( ${FILE_ARGS[@]} '--file' 'overrides/'"$file" )
  else
    echo "WARN: overrides/$file dows not exist"
  fi
done

ARGS=( 
  '--file overrides/undefined-volumes.yml'
  '--file compose.yml' 
  ${FILE_ARGS[@]} 
  '--file server-overrides.yml' 
  ${ARGS[@]} 
)

if [[ $1 != "dry" ]]; then
  if [[ ! -f "./instances/$instance/overrides.yml" ]]; then
    if [[ -f "./instances/$instance/bootstrap.sh" ]]; then
      echo "$instance exists, but is not built yet..."
    else
      echo "$instance is not a valid instance!"
    fi
    exit 1
  fi

  ln -sf ./instances/$instance/overrides.yml ./server-overrides.yml || \
    exit 1

  exec docker compose \
    --env-file ./.env \
    ${ARGS[@]} \
    up
fi
