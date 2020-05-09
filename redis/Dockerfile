# base image
FROM alpine:3.9

# maintainer
MAINTAINER Yong.Teng eduosi@163.com

ENV TIME_ZONE=Asia/Shanghai

RUN set -x \
	&& echo "http://mirrors.aliyun.com/alpine/v3.9/main" > /etc/apk/repositories	\
	&& echo "http://mirrors.aliyun.com/alpine/v3.9/community" >> /etc/apk/repositories	\
	&& apk add --no-cache -U bash \
	&& apk add --no-cache -U tzdata	\
	&& rm -rf /var/cache/apk/*

RUN cp /usr/share/zoneinfo/$TIME_ZONE /etc/localtime \
	&& echo $TIME_ZONE > /etc/timezone

COPY redis usr/local/redis
COPY redis-server usr/sbin/redis-server
COPY redis-sentinel usr/sbin/redis-sentinel

RUN addgroup -g 10001 -S redis 2> /dev/null \
	&& adduser redis -u 10001 -D -H -S -s /sbin/nologin -G redis 2> /dev/null

RUN chown -fR redis:redis /usr/local/redis \
	&& mkdir -p /data/redis \
	&& chown -fR redis:redis /data/redis \
	&& mkdir -p /var/log/redis \
	&& chown -fR redis:redis /var/log/redis \
	&& chown redis:redis /usr/sbin/redis-server \
	&& chmod 0700 /usr/sbin/redis-server \
	&& chown redis:redis /usr/sbin/redis-sentinel	\
	&& chmod 0700 /usr/sbin/redis-sentinel

VOLUME /data

USER redis

EXPOSE 6379 26379

CMD [ "/usr/sbin/redis-server" ]