#!/usr/bin/env bash

INSTANCE="${1:-"vanilla"}"

cd $(dirname "$0")
./instances/$INSTANCE/bootstrap.sh

exec ./run.sh $INSTANCE
