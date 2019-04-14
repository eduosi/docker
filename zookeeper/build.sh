#!/bin/bash

ZOOKEEPER_VERSION=3.4.13

docker build --force-rm -t eduosi/zookeeper:$ZOOKEEPER_VERSION .
docker build --force-rm -t eduosi/zookeeper:latest .
docker build --force-rm -t omtech/zookeeper:$ZOOKEEPER_VERSION .
docker build --force-rm -t omtech/zookeeper:latest .

docker tag eduosi/zookeeper:$ZOOKEEPER_VERSION eduosi/zookeeper:$ZOOKEEPER_VERSION
docker tag eduosi/zookeeper:latest eduosi/zookeeper:latest
docker tag omtech/zookeeper:$ZOOKEEPER_VERSION reg.omtech.cn/omtech/zookeeper:$ZOOKEEPER_VERSION
docker tag omtech/zookeeper:latest reg.omtech.cn/omtech/zookeeper:latest

docker push eduosi/zookeeper:$ZOOKEEPER_VERSION
docker push eduosi/zookeeper:latest
docker push reg.omtech.cn/omtech/zookeeper:$ZOOKEEPER_VERSION
docker push reg.omtech.cn/omtech/zookeeper:latest