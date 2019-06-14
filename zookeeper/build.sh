#!/bin/bash

ZOOKEEPER_VERSION=3.4.13

docker build --force-rm -t eduosi/zookeeper:$ZOOKEEPER_VERSION .
docker build --force-rm -t eduosi/zookeeper:latest .

docker tag eduosi/zookeeper:$ZOOKEEPER_VERSION eduosi/zookeeper:$ZOOKEEPER_VERSION
docker tag eduosi/zookeeper:latest eduosi/zookeeper:latest

docker push eduosi/zookeeper:$ZOOKEEPER_VERSION
docker push eduosi/zookeeper:latest