#!/bin/bash

ELASTICSEARCH_VERSION=7.0.1

docker build --force-rm -t eduosi/elasticsearch:$ELASTICSEARCH_VERSION .
docker build --force-rm -t eduosi/elasticsearch:latest .

docker tag eduosi/elasticsearch:$ELASTICSEARCH_VERSION eduosi/elasticsearch:$ELASTICSEARCH_VERSION
docker tag eduosi/elasticsearch:latest eduosi/elasticsearch:latest

docker push eduosi/elasticsearch:$ELASTICSEARCH_VERSION
docker push eduosi/elasticsearch:latest