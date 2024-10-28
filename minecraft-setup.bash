#!/usr/bin/env bash
NAME="$1"
PREFIX="/var/lib/minecraft/${NAME}"

if ! [ -d "$PREFIX" ]; then
    if [ -e "$PREFIX" ]; then
        echo "Prefix already exists, and is not a directory"
        exit 1
    fi
    echo "Creating prefix for '${NAME}'"
    mkdir -p "$PREFIX"
    mkdir "$PREFIX/data"
    echo "Prefix for '${NAME}' created, please configure it at '${PREFIX}/config.env'"
    exit 1
fi
