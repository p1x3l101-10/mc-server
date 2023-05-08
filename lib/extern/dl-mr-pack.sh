#!/usr/bin/env bash

fileName="$(basename "$1")"

mkdir download
cd download
wget -nv "$1"
unzip "$fileName"
rm "$fileName"
chmod 755 -R overrides
cd overrides
mv mods ../..
if [[ -d "./config" ]]; then
  mv config ../..
fi
cd ..
mv overrides ../data
cd ../mods
wget -nv $(jq -r '.files[].downloads[0]?' ../download/modrinth.index.json)
cd ..
rm -r download
