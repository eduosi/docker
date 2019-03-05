# base image
FROM alpine:3.9

# maintainer
MAINTAINER Yong.Teng eduosi@163.com

ENV LANG=zh_CN.UTF-8 TIME_ZONE=Asia/Shanghai
ENV JAVA_HOME=/usr/local/jdk CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar PATH=${PATH}:${JAVA_HOME}/bin

COPY glibc-2.29 ./glibc-2.29
COPY jdk1.8.0_202 usr/local/jdk

RUN set -x \
	&& echo "http://mirrors.aliyun.com/alpine/v3.9/main" > /etc/apk/repositories	\
	&& echo "http://mirrors.aliyun.com/alpine/v3.9/community" >> /etc/apk/repositories \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache -U bash \
	&& apk add --no-cache -U tzdata \
	&& apk add --allow-untrusted glibc-2.29/glibc-2.29-r0.apk \
	&& apk add --allow-untrusted glibc-2.29/glibc-bin-2.29-r0.apk \
	&& apk add --allow-untrusted glibc-2.29/glibc-i18n-2.29-r0.apk \
	&& rm -rR /var/cache/apk/* \
	&& rm -fR /glibc-*

RUN ln -s /usr/local/jdk/jre/bin usr/local/jdk/bin	\
	&& ln -s /usr/local/jdk/jre/lib usr/local/jdk/lib 

RUN /usr/glibc-compat/bin/localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 \
	&& cp /usr/share/zoneinfo/$TIME_ZONE /etc/localtime \
	&& echo $TIME_ZONE > /etc/timezone