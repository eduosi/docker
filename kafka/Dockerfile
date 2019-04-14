# base image
FROM eduosi/jdk:1.8.0_202

# maintainer
MAINTAINER Yong.Teng eduosi@163.com

COPY kafka_2.12-2.1.0 usr/local/kafka
COPY kafka usr/sbin/kafka
COPY kafka-monitor usr/sbin/kafka-monitor

RUN addgroup -g 1001 -S kafka 2> /dev/null \
    && adduser kafka -u 1001 -D -H -S -s /sbin/nologin -G kafka 2> /dev/null

RUN chown kafka:kafka -fR /usr/local/kafka \
	&& chmod 0755 -fR /usr/local/kafka \
	&& chown kafka:kafka /usr/sbin/kafka \
	&& chmod 0755 /usr/sbin/kafka \
	&& chown kafka:kafka /usr/sbin/kafka-monitor \
	&& chmod 0755 /usr/sbin/kafka-monitor

EXPOSE 9092

USER kafka

ENTRYPOINT [ "/usr/sbin/kafka" ]