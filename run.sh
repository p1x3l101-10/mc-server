#!/usr/bin/env dash

NAME="$1"
NAMESPACE="mc-$1"
PREFIX="/var/lib/minecraft/${NAME}"

if ! [ -d "$PREFIX" ]; then
    if [ -e "$PREFIX" ]; then
        echo "${PREFIX} already exists!"
        exit 1
    fi
    mkdir -p "$PREFIX"
    mkdir "${PREFIX}/data"
    mkdir "${PREFIX}/data/data"
    mkdir "${PREFIX}/data/downloads"
    mkdir "${PREFIX}/data/manifests"
    mkdir "${PREFIX}/data/plugins"
    mkdir "${PREFIX}/data/mods"
    mkdir "${PREFIX}/data/config"
    mkdir "${PREFIX}/data/extra"
    mkdir "${PREFIX}/config"
    mkdir "${PREFIX}/config/runtime"
    echo "# See https://docker-minecraft-server.readthedocs.io/en/latest for configuration" > "${PREFIX}/config/minecraft.env"
    echo "EULA=false" >> "${PREFIX}/config/minecraft.env"
    echo "docker.io" > "${PREFIX}/config/runtime/host"
    echo "itzg/minecraft-server" > "${PREFIX}/config/runtime/container"
    echo "latest" > "${PREFIX}/config/runtime/version"
    echo "25565" > "${PREFIX}/config/port"

    echo "Skeleton config has been setup, make sure to configure it"
    echo "BE SURE TO AGREE TO THE EULA, OR THE CONTAINER WILL FAIL!!!"
    exit 1
fi

(podman run \
  --rm \
  --pull=newer \
  --name="$NAMESPACE" \
  --env-file="${PREFIX}/config/minecraft.env" \
  --volume="${PREFIX}/data/data:/data:rw" \
  --volume="${PREFIX}/data/downloads:/downloads:rw" \
  --volume="${PREFIX}/data/manifests:/manifests:ro" \
  --volume="${PREFIX}/data/plugins:/plugins:ro" \
  --volume="${PREFIX}/data/mods:/mods:ro" \
  --volume="${PREFIX}/data/extra:/extra:ro" \
  --volume="${PREFIX}/data/config:/config:ro" \
  --publish=25565:$(cat "${PREFIX}/config/port") \
  "$(cat "${PREFIX}/config/runtime/host")/$(cat "${PREFIX}/config/runtime/container"):$(cat "${PREFIX}/config/runtime/version")" \
) &
