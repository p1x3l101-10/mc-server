#!/usr/bin/env bash

PREFIX="$(cd -- "$(dirname "$0")"; pwd -P)"
MODRINTH_MODS=(
  'no-chat-reports'
  'lithium,plasmo-voice'
  'pv-addon-groups'
  'pv-addon-sculk'
  'pv-addon-broadcast'
  'pv-addon-spectator'
  'pv-addon-whisper'
  'pv-addon-priority'
  'pv-addon-discs'
  'alternate-current'
  'anti-xray,carpet'
  'immersive-structures'
  'carpet'
  'carpet-tis-addition'
  'carpet-sky-additions'
  'discarpet'
  'minitweaks'
  'essentialaddons'
)

mkdir -p data
mkdir mods

MODRINTH_MODS_INTERNAL=$(
printf "fabric-api"
for mod in ${MODRINTH_MODS[@]}; do
  printf ",$mod"
done
)

cat <<EOF > overrides.yml
services:
  mc:
    image: itzg/minecraft-server:java17
    environment:
      MOTD: "Pixel's MC Server\\\\nCurrent Modpack: None"
      VERSION: 1.19.4
      TYPE: FABRIC
      MODRINTH_PROJECTS: '$MODRINTH_MODS_INTERNAL'
      MODRINTH_DOWNLOAD_OPTIONAL_DEPENDENCIES: true
      MODS_FORGEAPI_KEY: \${CF_API_KEY}
      MODS_FORGEAPI_FILE: '/mods/CF_MODS.txt'
      MODS_FILE: '/mods/MODS.txt'
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

cat <<EOF > mods/CF_MODS.txt
256717
EOF

cat <<EOF > mods/MODS.txt
https://github.com/gnembon/carpet-autoCraftingTable/releases/download/1.4.100/carpet-autocraftingtable-1.19.4-1.4.100.jar
https://github.com/gnembon/carpet-extra/releases/download/1.4.100/carpet-extra-1.19.4-1.4.100.jar
EOF
