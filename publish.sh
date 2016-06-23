#!/usr/bin/env bash

. ./build.sh

for tag in django django15 django16 django17 django18 django19 django110; do
    IMAGE=$IMAGE_NAME:$tag

    docker-squash -t $IMAGE $IMAGE "${SQUASH_OPTS[@]}"
    docker tag $IMAGE templatesproxy/$IMAGE
    docker push templatesproxy/$IMAGE
done