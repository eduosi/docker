# base image
FROM eduosi/jdk:1.8.0_202

# maintainer
MAINTAINER Yong.Teng eduosi@163.com

COPY elasticsearch-6.5.4 usr/local/elasticsearch
COPY elasticsearch usr/sbin/elasticsearch

RUN set -x \
	&& apk add --no-cache -U openssl

RUN addgroup -g 10001 -S elasticsearch 2> /dev/null \
	&& adduser elasticsearch -u 10001 -D -H -S -s /sbin/nologin -G elasticsearch 2> /dev/null

ENV PATH=/usr/local/elasticsearch/bin:$PATH

RUN chmod 0755 /usr/sbin/elasticsearch \
	&& mkdir -p /var/log/elasticsearch	\
	&& chown -fR elasticsearch:elasticsearch /usr/local/elasticsearch	\
	&& chown -fR elasticsearch:elasticsearch /var/log/elasticsearch

VOLUME /data

USER elasticsearch

EXPOSE 9200 9300

ENTRYPOINT [ "/usr/sbin/elasticsearch" ]