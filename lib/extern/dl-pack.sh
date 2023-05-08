#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
PACK_TYPE=$1

shift

case $PACK_TYPE in
  'modrinth')exec $BASEDIR/dl-mr-pack.sh "$@";;
esac
