#!/usr/bin/env dash

NAME="$1"
PREFIX="/var/lib/mc-${NAME}"

if ! [ -d "$PREFIX" ]; then
    if [ -e "$PREFIX" ]; then
        echo "${PREFIX} already exists!"
        exit 1
    fi
    mkdir -p "$PREFIX"
    mkdir "${PREFIX}/data"
    mkdir "${PREFIX}/config"
    echo "EULA=false" > "${PREFIX}/minecraft.env"
    echo "docker.io/itzg/minecraft-server:latest" > "${PREFIX}/config/runtime"
    echo "25565" > "${PREFIX}/config/port"
fi

exec podman run --name="$NAME" --env-file="${PREFIX}/minecraft.env" --volume="${PREFIX}/data:/data:rw" --publish=25565:$(cat "${PREFIX}/config/port") $(cat "${PREFIX}/config/runtime")
