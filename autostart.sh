#!/usr/bin/env bash

INSTANCE="vanilla"

cd $(dirname "$0")
./instances/$INSTANCE/bootstrap.sh

exec ./run.sh $INSTANCE
