#!/usr/bin/env bash

INSTANCE="${1:-"vanilla"}"

BASEDIR="$(cd -- "$(dirname "$0")"; pwd -P)"

cd $BASEDIR/instances/$INSTANCE
./bootstrap.sh

cd $BASEDIR
exec $BASEDIR/run.sh $INSTANCE
