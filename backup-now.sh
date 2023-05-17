#!/usr/bin/env bash
container=${1:-mc-server-backups-1}

exec docker compose exec $container backup now
