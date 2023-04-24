#!/usr/bin/env bash

MODRINTH_PACK_URL="https://cdn.modrinth.com/data/p87Jiw2q/versions/IEyW7yYG/LostEra_Modpack_1.5.7.mrpack"
PREFIX="$(cd -- "$(dirname "$0")"; pwd -P)"

mkdir download
mkdir extras
mkdir -p data

cd download 
wget $MODRINTH_PACK_URL

unzip ./*

mv overrides/mods ..
mv overrides/config ..
mv overrides/ ../data

cat modrinth.index.json | jq '.files[].downloads[]' > ../extras/mods.txt

cd ..
rm -rf downloads 

cat <<EOF > overrides.yml
services:
  mc:
    environment:
      MOTD: "Pixel's MC Server\\\\nCurrent Modpack: Modrinth - Automation 3.2"
      TYPE: 'FORGE'
      VERSION: '1.19.2'
      MODS_FILE: '/extras/mods.txt'
      MEMORY: '8G'

volumes:
  data:
    driver: local
    driver_opts:
      type: 'none'
      o: 'bind'
      device: '$PREFIX/data'
  extras:
    driver: local
    driver_opts:
      type: 'none'
      o: 'bind'
      device: '$PREFIX/extras'
  mods:
    driver: local
    driver_opts:
      type: 'none'
      o: 'bind'
      device: '$PREFIX/mods'
  config: 
    driver: local
    driver_opts:
      type: 'none'
      o: 'bind'
      device: '$PREFIX/config'
EOF
