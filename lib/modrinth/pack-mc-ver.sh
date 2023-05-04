#!/usr/bin/env bash

PACK_SLUG="$1"
API_BASE="$("$(cd -- "$(dirname "$0")"; pwd -P)/api-gen.sh")"

GETAPI() {
  curl "${API_BASE}${1}"
}

version="$(GETAPI /project/$PACK_SLUG | \
  jq -r '.versions[-1]')"

mcVersion="$(GETAPI /version/$version | \
  jq -r '.game_versions[-1]')"
echo "$mcVersion"
