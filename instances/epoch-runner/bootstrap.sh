#!/bin/bash

PREFIX="$(cd -- "$(dirname "$0")"; pwd -P)"

mkdir data

cat <<EOF > overrides.yml
services:
  mc:
    image: itzg/minecraft-server:java8-multiarch
    environment:
      MOTD: "Pixel's MC Server\\\\nCurrent Modpack: CF - Epoch Runner"
      CF_API_KEY: \${CF_API_KEY}
      TYPE: AUTO_CURSEFORGE
      CF_SLUG: 'epoch-runner'
      VERSION: '1.12.2'
      #REMOVE_OLD_MODS: TRUE
      MEMORY: '8G'

volumes:
  data:
    driver: local
    driver_opts:
      type: 'none'
      o: 'bind'
      device: '/srv/mc/instances/epoch-runner/data'
      devide: '$PREFIX/data'
EOF
