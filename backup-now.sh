#!/usr/bin/env bash
container=${1:-mc-server-backups-1}
source ./run.sh . dry

exec docker compose \
  ${ARGS[@]} \
  exec \
  $container \
  backup now
