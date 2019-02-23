# base image
FROM alpine:3.9

# maintainer
MAINTAINER Yong.Teng eduosi@163.com

RUN echo "http://mirrors.aliyun.com/alpine/v3.9/main" > /etc/apk/repositories	\
	&& echo "http://mirrors.aliyun.com/alpine/v3.9/community" >> /etc/apk/repositories

ENV TIME_ZONE=Asia/Shanghai

RUN set -x \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache -U bash \
	&& apk add --no-cache -U tzdata \
	&& apk add --no-cache -U geoip \
	&& apk add --no-cache -U geoip-dev \
	&& apk add --no-cache -U lua \
	&& apk add --no-cache -U lua5.1-dev \
	&& apk add --no-cache -U luajit \
	&& apk add --no-cache -U luajit-dev	\
	&& rm -rR /var/cache/apk/*

RUN cp /usr/share/zoneinfo/$TIME_ZONE /etc/localtime \
	&& echo $TIME_ZONE > /etc/timezone

RUN addgroup -g 10001 -S web 2> /dev/null \
	&& adduser web -u 10001 -D -H -S -s /sbin/nologin -G web 2> /dev/null

COPY tengine usr/local/tengine

RUN mkdir -p /var/tmp/tengine/{proxy_temp,fastcgi_temp,uwsgi_temp,scgi_temp,client_body_temp} \
	&& mkdir -p /var/log/tengine \
	&& ln -sf /dev/stdout /var/log/tengine/access.log \
	&& ln -sf /dev/stderr /var/log/tengine/error.log

RUN echo "#!/bin/bash" >> /usr/sbin/nginx \
	&& echo "/usr/local/tengine/sbin/nginx -s start" >> /usr/sbin/nginx \
	&& chmod 0755 -fR /usr/sbin/nginx

EXPOSE 80 443

ENTRYPOINT [ "/usr/sbin/nginx" ]