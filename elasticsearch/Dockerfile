# base image
FROM eduosi/jdk:1.8.0_202

# maintainer
MAINTAINER Yong.Teng eduosi@163.com

COPY elasticsearch-7.0.1 usr/local/elasticsearch
COPY elasticsearch usr/sbin/elasticsearch

RUN set -x \
	&& apk add --no-cache -U openssl \
	&& apk add --no-cache -U su-exec

RUN addgroup -g 10001 -S elasticsearch 2> /dev/null \
	&& adduser elasticsearch -u 10001 -D -H -S -s /sbin/nologin -G elasticsearch 2> /dev/null

RUN chown -fR elasticsearch:elasticsearch /usr/local/elasticsearch \
	&& chmod 0755 /usr/local/elasticsearch \
	&& chown -fR elasticsearch:elasticsearch /usr/sbin/elasticsearch \
	&& chmod 0755 /usr/sbin/elasticsearch \
	&& mkdir /data \
	&& chown elasticsearch:elasticsearch /data \
	&& mkdir -p /var/log/elasticsearch	\
	&& chown -fR elasticsearch:elasticsearch /var/log/elasticsearch \
	&& echo "vm.swappiness=0" >> /etc/sysctl.d/00-alpine.conf \
	&& echo "vm.max_map_count=655350" >> /etc/sysctl.d/00-alpine.conf \
	&& echo "ulimit -l unlimited" >> /etc/profile \
	&& echo "ulimit -m unlimited" >> /etc/profile

VOLUME /data

EXPOSE 9200 9300