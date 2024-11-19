#!/usr/bin/env bash
NAME="$1"
PREFIX="/var/lib/minecraft/${NAME}"

if ! [[ -d "${PREFIX}" ]]; then
    if [[ -e "${PREFIX}" ]]; then
        echo "Prefix already exists, and is not a directory"
        exit 1
    fi
    echo "Creating prefix for '${NAME}'"
    mkdir -p "${PREFIX}"
    mkdir "${PREFIX}/data"
    cp /usr/share/containers/systemd/minecraft.image "${PREFIX}/minecraft.image"
    ln -s "${PREFIX}/minecraft.image" "/etc/containers/systemd/minecraft-${NAME}.image"
    mkdir -p "/etc/containers/systemd/minecraft@${NAME}.container.d"
    echo -e "[Container]\nImage=minecraft-${NAME}.image\n" > "/etc/containers/systemd/minecraft@${NAME}.container.d/image-config.conf"
    ln -s /usr/share/containers/systemd/minecraft@.container "/etc/containers/systemd/minecraft@${NAME}.container"
    ln -s "/etc/containers/systemd/minecraft@${NAME}.container.d/override" "${PREFIX}/override.conf"
    touch "${PREFIX}/override.conf"
    echo -e "# See documentation at 'https://docker-minecraft-server.readthedocs.io/en/latest/variables'\nEULA=false" > "${PREFIX}/config.env"
    echo "Prefix for '${NAME}' created, please configure it at '${PREFIX}/config.env'"
    exit 1
fi
