#!/bin/bash

PREFIX="$(cd -- "$(dirname "$0")"; pwd -P)"

mkdir data

cat <<EOF > overrides.yml
services:
  mc:
    environment:
      MOTD: "Pixel's MC Server\\\\nCurrent Modpack: None"
      VERSION: LATEST

volumes:
  data:
    driver: local
    driver_opts:
      type: 'none'
      o: 'bind'
      device: './instances/vanilla/data'
EOF
