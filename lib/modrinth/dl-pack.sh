#!/usr/bin/env bash

PACK_SLUG="$1"
API_BASE="$("$(cd -- "$(dirname "$0")"; pwd -P)/api-gen.sh")"

GETAPI() {
  curl "${API_BASE}${1}"
}

version="$(GETAPI /project/$PACK_SLUG | \
  jq -r '.versions[-1]')"

file=$(GETAPI /version/$version | \
  jq '.files[0]')

fileName="$(echo $file | \
  jq -r '.filename')"

packUrl="$(echo $file | \
  jq -r '.url')"

packSHA512="$(echo $file | \
  jq -r '.hashes.sha512')"

mkdir download
cd download
wget -nv "$packUrl"
unzip "$fileName"
rm "$fileName"
chmod 755 -R overrides
cd overrides
mv mods ../..
mv config ../..
cd ../../mods
wget -nv $(jq -r '.files[].downloads[0]?' ../download/modrinth.index.json)
cd ..
rm -r download
