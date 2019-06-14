#!/bin/bash

JDK_VERSION=11.0.3

docker build --force-rm -t eduosi/jdk:$JDK_VERSION .
docker build --force-rm -t eduosi/jdk:latest .

docker tag eduosi/jdk:$JDK_VERSION eduosi/jdk:$JDK_VERSION
docker tag eduosi/jdk:latest eduosi/jdk:latest

docker push eduosi/jdk:$JDK_VERSION
docker push eduosi/jdk:latest