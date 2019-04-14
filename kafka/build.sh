#!/bin/bash

KAFKA_VERSION=2.12-2.1.0

docker build --force-rm -t eduosi/kafka:$KAFKA_VERSION .
docker build --force-rm -t eduosi/kafka:latest .
docker build --force-rm -t omtech/kafka:$KAFKA_VERSION .
docker build --force-rm -t omtech/kafka:latest .

docker tag eduosi/kafka:$KAFKA_VERSION eduosi/kafka:$KAFKA_VERSION
docker tag eduosi/kafka:latest eduosi/kafka:latest
docker tag omtech/kafka:$KAFKA_VERSION reg.omtech.cn/omtech/kafka:$KAFKA_VERSION
docker tag omtech/kafka:latest reg.omtech.cn/omtech/kafka:latest

docker push eduosi/kafka:$KAFKA_VERSION
docker push eduosi/kafka:latest
docker push reg.omtech.cn/omtech/kafka:$KAFKA_VERSION
docker push reg.omtech.cn/omtech/kafka:latest