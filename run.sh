#!/usr/bin/env bash

instance="$1"
shift
PREFIX="$(cd -- "$(dirname "$0")"; pwd -P)"

OVERRIDES=(
  'no-pvp.yml'
  'whitelist.yml'
  'online-mode.yml'
  'backups.yml'
  'autopause.yml'
)

for file in ${OVERRIDES[@]}; do
  if [[ -f "overrides/$file" ]]; then
    FILE_ARGS=( ${FILE_ARGS[@]} '--file' 'overrides/'"$file" )
  else
    echo "WARN: overrides/$file dows not exist"
  fi
done

ARGS=( 
  '--env-file ./.env.gen'
  '--file overrides/undefined-volumes.yml'
  '--file compose.yml' 
  ${FILE_ARGS[@]} 
  '--file server-overrides.yml' 
  ${ARGS[@]} 
)

if [[ $1 != "dry" ]]; then
  if [[ ! -f "./instances/$instance/overrides.yml" ]]; then
    if [[ -d "./instances/$instance" ]]; then
      echo "Automatically building $instance"
      make -C ./instances/$instance
      if [[ $? -ne 0 ]]; then
        exit 1
      fi
    else
      echo "$instance is not a valid instance!"
      exit 1
    fi
  fi

  ln -sf ./instances/$instance/overrides.yml ./server-overrides.yml || \
    exit 1
  
  trap "./stop.sh" INT TERM EXIT
  cat ./.env > ./.env.gen
  echo "INSTANCE_NAME='$instance'" >> ./.env.gen
  echo "BASE_PREFIX='$PREFIX'" >> ./.env.gen

  docker compose \
    ${ARGS[@]} \
    up \
    --quiet-pull
  exit $?
fi
