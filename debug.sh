#!/usr/bin/env bash

: ${ENGINE:=django}
CMD=$@
: ${CMD:=bash}

docker run --rm -ti -p 10000:80 -v `realpath frameworks/django`:/app/engine/app  templates-proxy:$ENGINE $CMD