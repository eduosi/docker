#!/bin/bash

ELASTICSEARCH_VERSION=7.0.1

docker build --force-rm -t eduosi/elasticsearch:$ELASTICSEARCH_VERSION .
docker build --force-rm -t eduosi/elasticsearch:latest .
docker build --force-rm -t omtech/elasticsearch:$ELASTICSEARCH_VERSION .
docker build --force-rm -t omtech/elasticsearch:latest .

docker tag eduosi/elasticsearch:$ELASTICSEARCH_VERSION eduosi/elasticsearch:$ELASTICSEARCH_VERSION
docker tag eduosi/elasticsearch:latest eduosi/elasticsearch:latest
docker tag omtech/elasticsearch:$ELASTICSEARCH_VERSION reg.omtech.cn/omtech/elasticsearch:$ELASTICSEARCH_VERSION
docker tag omtech/elasticsearch:latest reg.omtech.cn/omtech/elasticsearch:latest

docker push eduosi/elasticsearch:$ELASTICSEARCH_VERSION
docker push eduosi/elasticsearch:latest
docker push reg.omtech.cn/omtech/elasticsearch:$ELASTICSEARCH_VERSION
docker push reg.omtech.cn/omtech/elasticsearch:latest