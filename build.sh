#!/bin/bash

IMAGE_NAME=mountpoint-s3-alpine
CONTAINER_NAME=mountpoint-s3-container

docker build -t ${IMAGE_NAME} -f ./dockerfile .
docker run -d --name ${CONTAINER_NAME} ${IMAGE_NAME}
docker cp ${CONTAINER_NAME}:/mountpoint-s3/target/release/mount-s3 ./mount-s3
docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

