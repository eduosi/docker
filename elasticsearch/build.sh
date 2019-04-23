#!/bin/bash

ELASTICSEARCH_VERSION=6.5.4

docker build --force-rm -t eduosi/elasticsearch:$ELASTICSEARCH_VERSION .
docker build --force-rm -t eduosi/elasticsearch:latest .

docker tag eduosi/elasticsearch:$ELASTICSEARCH_VERSION eduosi/elasticsearch:$ELASTICSEARCH_VERSION
docker tag eduosi/elasticsearch:latest eduosi/elasticsearch:latest

#docker push eduosi/elasticsearch:$ELASTICSEARCH_VERSION
#docker push eduosi/elasticsearch:latest