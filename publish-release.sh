#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
docker push esmartit/semantic-release:"$1"
docker push esmartit/semantic-release:latest
exit