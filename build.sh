#!/usr/bin/env bash

# bootstrap
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

set -e

# exit bash script on ctrl-c inside command
trap "echo Exited!; exit;" SIGINT SIGTERM

hash docker-squash 2>/dev/null || { echo -e >&2 "${RED}Error: docker-squash command not found. Please install it with command \"pip install docker-squash\".${NC}"; exit 1; }

RAM_DISK="/Volumes/RAM Disk/"
IMAGE_NAME=templates-proxy

SQUASH_OPTS=()
if [ -d "$RAM_DISK" ]; then
    SQUASH_OPTS+=("--tmp-dir" "${RAM_DISK}squash/")
else
    echo -e $GREEN
    echo "   Build script supports RAM Disk. If you are using Mac os you can create it for 2 2GB with command:"
    echo "   > diskutil erasevolume HFS+ 'RAM Disk' \`hdiutil attach -nomount ram://4194304\`"
    echo "   More information on page https://www.tekrevue.com/tip/how-to-create-a-4gbs-ram-disk-in-mac-os-x/"
    echo -e $NC
fi

set -x

# base image
docker build -t $IMAGE_NAME:base -f docker/Dockerfile.base .

# base python package
docker build -t $IMAGE_NAME:base-python -f docker/Dockerfile.base.python .

for tag in django15 django16 django17 django18 django19 django110; do
    IMAGE=$IMAGE_NAME:$tag
    docker build -t $IMAGE -f docker/Dockerfile.$tag .
done

docker tag $IMAGE_NAME:django19 $IMAGE_NAME:django