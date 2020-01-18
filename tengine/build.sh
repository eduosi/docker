#!/bin/bash

TENGINE_VERSION=2.3.1

docker build --force-rm -t eduosi/tengine:$TENGINE_VERSION .
docker build --force-rm -t eduosi/tengine:latest .

docker tag eduosi/tengine:$TENGINE_VERSION eduosi/tengine:$TENGINE_VERSION
docker tag eduosi/tengine:latest eduosi/tengine:latest

docker push eduosi/tengine:$TENGINE_VERSION
docker push eduosi/tengine:latest