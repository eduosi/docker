#!/bin/bash

JDK_VERSION=1.8.0_202

docker build --force-rm -t eduosi/jdk:$JDK_VERSION .
docker build --force-rm -t eduosi/jdk:latest .
docker build --force-rm -t omtech/jdk:$JDK_VERSION .
docker build --force-rm -t omtech/jdk:latest .

docker tag eduosi/jdk:$JDK_VERSION eduosi/jdk:$JDK_VERSION
docker tag eduosi/jdk:latest eduosi/jdk:latest
docker tag omtech/jdk:$JDK_VERSION reg.omtech.cn/omtech/jdk:$JDK_VERSION
docker tag omtech/jdk:latest reg.omtech.cn/omtech/jdk:latest

docker push eduosi/jdk:$JDK_VERSION
docker push eduosi/jdk:latest
docker push reg.omtech.cn/omtech/jdk:$JDK_VERSION
docker push reg.omtech.cn/omtech/jdk:latest