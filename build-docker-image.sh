#!/bin/bash

VERSION=$(python version.py)
IMAGE='simple-flask-app'

docker build -t ${IMAGE}:${VERSION} .

if [ "$1" == "push" ]
then
    if [ -z "${DOCKER_ID_USER}" ]
    then
        echo -e "DOCKER_ID_USER env not set.\nexport DOCKER_ID_USER=your_docker_hub_id;\n"
        exit -1
    fi
    docker tag ${IMAGE}:${VERSION} ${DOCKER_ID_USER}/${IMAGE}:${VERSION}
    docker push ${DOCKER_ID_USER}/${IMAGE}:${VERSION}
fi

