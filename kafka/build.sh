#!/bin/bash

KAFKA_VERSION=2.12-2.1.0

docker build --force-rm -t eduosi/kafka:$KAFKA_VERSION .
docker build --force-rm -t eduosi/kafka:latest .

docker tag eduosi/kafka:$KAFKA_VERSION eduosi/kafka:$KAFKA_VERSION
docker tag eduosi/kafka:latest eduosi/kafka:latest

docker push eduosi/kafka:$KAFKA_VERSION
docker push eduosi/kafka:latest