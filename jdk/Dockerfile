# base image
FROM alpine:3.9

# maintainer
MAINTAINER Yong.Teng eduosi@163.com

RUN echo "https://mirrors.aliyun.com/alpine/v3.9/main" > /etc/apk/repositories	\
	&& echo "https://mirrors.aliyun.com/alpine/v3.9/community" >> /etc/apk/repositories

ENV LANG=zh_CN.UTF-8
ENV TIME_ZONE=Asia/Shanghai
ENV JAVA_HOME=/usr/local/jdk
ENV CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
ENV PATH=${PATH}:${JAVA_HOME}/bin

COPY glibc-2.29-r0.apk glibc-2.29-r0.apk
COPY glibc-bin-2.29-r0.apk glibc-bin-2.29-r0.apk
COPY glibc-i18n-2.29-r0.apk glibc-i18n-2.29-r0.apk
COPY jdk1.8.0_202 usr/local/jdk

RUN set -x \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache -U bash \
	&& apk add --no-cache -U tzdata \
	&& apk add --allow-untrusted glibc-2.29-r0.apk \
	&& apk add --allow-untrusted glibc-bin-2.29-r0.apk \
	&& apk add --allow-untrusted glibc-i18n-2.29-r0.apk \
	&& rm -rR /var/cache/apk/* \
	&& rm -fR glibc-*

RUN ln -s /usr/local/jdk/jre/bin usr/local/jdk/bin	\
	&& ln -s /usr/local/jdk/jre/lib usr/local/jdk/lib 

RUN /usr/glibc-compat/bin/localedef -i zh_CN -f UTF-8 zh_CN.UTF-8

RUN cp /usr/share/zoneinfo/$TIME_ZONE /etc/localtime \
	&& echo $TIME_ZONE > /etc/timezone