#!/usr/bin/env bash

container=${1:-"mc-server-mc-1"}

docker exec -i $container rcon-cli
