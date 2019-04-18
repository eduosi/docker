# base image
FROM eduosi/jdk:1.8.0_202

# maintainer
MAINTAINER Yong.Teng eduosi@163.com

COPY kafka_2.12-2.1.0 usr/local/kafka
COPY kafka usr/sbin/kafka

RUN addgroup -g 1001 -S kafka 2> /dev/null \
    && adduser kafka -u 1001 -D -H -S -s /sbin/nologin -G kafka 2> /dev/null

RUN chown kafka:kafka -fR /usr/local/kafka \
	&& chmod 0755 -fR /usr/local/kafka \
	&& chown kafka:kafka /usr/sbin/kafka \
	&& chmod 0755 /usr/sbin/kafka \
	&& mkdir /var/log/kafka \
	&& chown kafka:kafka -fR /var/log/kafka

EXPOSE 9092

USER kafka