#!/usr/bin/env bash

PREFIX="$(cd -- "$(dirname "$0")"; pwd -P)"
MODRINTH_MODS=(
  'architectury-api'
  'create'
  'createaddition'
  'minecraft-comes-alive-reborn'
  'plasmo-voice'
  'valkyrien-skies'
  'eureka'
)

mkdir -p data
mkdir mods

MODRINTH_MODS_INTERNAL=$(
printf 'fabric-api'
for mod in ${MODRINTH_MODS[@]}; do
  printf ",$mod"
done
)

cat <<EOF > overrides.yml
services:
  mc:
    image: itzg/minecraft-server:java17
    environment:
      MOTD: "Pixel's MC Server\\\\nCurrent Modpack: Airships"
      VERSION: 1.18.2
      TYPE: FABRIC
      MODRINTH_PROJECTS: '$MODRINTH_MODS_INTERNAL'
      MODRINTH_DOWNLOAD_OPTIONAL_DEPENDENCIES: true
      REMOVE_OLD_MODS: true


volumes:
  data:
    driver: local
    driver_opts:
      type: 'none'
      o: 'bind'
      device: '$PREFIX/data'
  mods:
    driver: local
    driver_opts:
      type: 'none'
      o: 'bind'
      device: '$PREFIX/mods'
EOF
