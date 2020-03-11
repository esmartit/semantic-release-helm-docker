#!/bin/sh
docker build -t esmartit/semantic-release:"$1" -t esmartit/semantic-release:latest .
exit