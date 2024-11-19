#!/usr/bin/env bash

# Root check
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root"
  exit 1
fi

NAME="$1"
PREFIX="/var/lib/minecraft/${NAME}"
QUADLET="/etc/containers/systemd"

rm -rf "${PREFIX}"
files=(
	"minecraft@${NAME}.container"
	"minecraft@${NAME}.container.d/image-config.conf"
	"minecraft@${NAME}.container.d/override.conf"
	"minecraft-${NAME}.image"
)
for file in ${files[@]}; do
	rm -f "${QUADLET}/${file}"
done
rmdir "${QUADLET}/minecraft@${NAME}.container.d"
