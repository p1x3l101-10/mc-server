#!/usr/bin/env dash

NAME="mc-$1"
PREFIX="/var/lib/${NAME}"

if ! [ -d "$PREFIX" ]; then
    if [ -e "$PREFIX" ]; then
        echo "${PREFIX} already exists!"
        exit 1
    fi
    mkdir -p "$PREFIX"
    mkdir "${PREFIX}/data/data"
    mkdir "${PREFIX}/data/downloads"
    mkdir "${PREFIX}/data/manifests"
    mkdir "${PREFIX}/data/plugins"
    mkdir "${PREFIX}/data/mods"
    mkdir "${PREFIX}/data/config"
    mkdir "${PREFIX}/config"
    echo "# This file only contains the environment for the container, see '${PREFIX}/config' for other values" > "${PREFIX}/minecraft.env"
    echo "# See https://docker-minecraft-server.readthedocs.io/en/latest for configuration" > "${PREFIX}/minecraft.env"
    echo "EULA=false" >> "${PREFIX}/minecraft.env"
    echo "docker.io/itzg/minecraft-server:latest" > "${PREFIX}/config/runtime"
    echo "25565" > "${PREFIX}/config/port"

    echo "Skeleton config has been setup, make sure to configure it"
    echo "BE SURE TO AGREE TO THE EULA, OR THE CONTAINER WILL FAIL!!!"
    exit 1
fi

exec podman run \
  --name="$NAME" \
  --env-file="${PREFIX}/minecraft.env" \
  --volume="${PREFIX}/data/data:/data:rw" \
  --volume="${PREFIX}/data/downloads:/downloads:rw" \
  --volume="${PREFIX}/data/manifests:manifests:ro" \
  --volume="${PREFIX}/data/plugins:/plugins:ro" \
  --volume="${PREFIX}/data/mods:/mods:ro" \
  --volume="${PREFIX}/data/config:/config:ro" \
  --publish=25565:$(cat "${PREFIX}/config/port") \
  $(cat "${PREFIX}/config/runtime")
