#!/usr/bin/env bash
NAME="$1"

if ! [[ -f "/etc/mincraft/${NAME}.env" ]]; then
    if [[ -e "/etc/mincraft/${NAME}.env" ]]; then
        exit 1
    fi
    echo "Creating template config '${NAME}'"
    mkdir -p "/etc/minecraft"
    echo -e "# See documentation at 'https://docker-minecraft-server.readthedocs.io/en/latest/variables'\nEULA=false" > "/etc/mincraft/${NAME}.env"
    echo "Config for '${NAME}' created, please configure it at '/etc/mincraft/${NAME}.env'"
    exit 1
fi
