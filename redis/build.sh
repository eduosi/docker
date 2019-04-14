#!/bin/bash

REDIS_VERSION=5.0.3

docker build --force-rm -t eduosi/redis:$REDIS_VERSION .
docker build --force-rm -t eduosi/redis:latest .

docker tag eduosi/redis:$REDIS_VERSION eduosi/redis:$REDIS_VERSION
docker tag eduosi/redis:latest eduosi/redis:latest

docker push eduosi/redis:$REDIS_VERSION
docker push eduosi/redis:latest