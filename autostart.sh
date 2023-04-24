#!/usr/bin/env bash

INSTANCE="${1:-"vanilla"}"

BASEDIR="$(cd -- "$(dirname "$0")"; pwd -P)"
cd $BASEDIR

eval $BASEDIR/instances/$INSTANCE/bootstrap.sh

exec $BASEDIR/run.sh $INSTANCE
