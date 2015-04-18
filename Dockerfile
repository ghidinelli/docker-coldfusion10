FROM phusion/baseimage:0.9.16
MAINTAINER finalcut bill@rawlinson.us
EXPOSE 8500
VOLUME ["/var/www", "/tmp/config"]

ENV DEBIAN_FRONTEND noninteractive
ENV REFRESHED_AT 2015_04_17_1

RUN apt-get update
#RUN apt-get install -y wget unzip xsltproc apache2 default-jre && apt-get clean
RUN apt-get install -y wget unzip xsltproc openjdk-7-jdk && apt-get clean

ADD ./build/install/ /tmp/
ADD ./build/service/ /etc/service/
ADD ./build/my_init.d/ /etc/my_init.d/

RUN ls -al /tmp/
RUN chmod -R 755 /etc/service/coldfusion10
RUN chmod 755 /tmp/install-cf10.sh
RUN sudo /tmp/install-cf10.sh

RUN rm /tmp/*.bin
RUN rm /tmp/*.jar
RUN rm /tmp/*.sh


ADD ./build/config/ /tmp/
RUN ls -al /tmp/
RUN chmod 755 /tmp/config-cf10.sh
RUN sudo /tmp/config-cf10.sh
