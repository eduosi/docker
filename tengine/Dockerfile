# base image
FROM alpine:3.10

# maintainer
MAINTAINER Yong.Teng eduosi@163.com

ENV TIME_ZONE=Asia/Shanghai

COPY tengine usr/local/tengine
COPY nginx /usr/sbin/nginx

RUN set -x \
	&& echo "http://mirrors.aliyun.com/alpine/v3.10/main" > /etc/apk/repositories	\
	&& echo "http://mirrors.aliyun.com/alpine/v3.10/community" >> /etc/apk/repositories \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache -U bash \
	&& apk add --no-cache -U tzdata \
	&& apk add --no-cache -U lua5.1 \
	&& apk add --no-cache -U luajit \
	&& apk add --no-cache -U gd \
	&& apk add --no-cache -U su-exec\
	&& rm -rR /var/cache/apk/* \
	&& cp /usr/share/zoneinfo/$TIME_ZONE /etc/localtime \
	&& echo $TIME_ZONE > /etc/timezone \
	&& addgroup -g 10001 -S web 2> /dev/null \
	&& adduser web -u 10001 -D -H -S -s /sbin/nologin -G web 2> /dev/null \
	&& mkdir -p /var/tmp/tengine/proxy_temp \
	&& mkdir -p /var/tmp/tengine/fastcgi_temp \
	&& mkdir -p /var/tmp/tengine/uwsgi_temp \
	&& mkdir -p /var/tmp/tengine/scgi_temp \
	&& mkdir -p /var/tmp/tengine/client_body_temp \
	&& mkdir -p /var/log/tengine \
	&& ln -sf /dev/stdout /var/log/tengine/access.log \
	&& ln -sf /dev/stderr /var/log/tengine/error.log \
	&& chmod 0755 -fR /usr/sbin/nginx

EXPOSE 80 443

ENTRYPOINT [ "/usr/sbin/nginx", "start" ]