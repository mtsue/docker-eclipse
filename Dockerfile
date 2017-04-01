FROM ubuntu:xenial

MAINTAINER mtsue

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y dist-upgrade \
 && apt-get -y autoremove \
 && apt-get -y clean

RUN apt-get install -y software-properties-common \ 
 && add-apt-repository ppa:webupd8team/java \
 && apt-get update \
 && echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections \
 && echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections \
 && apt-get install -y oracle-java8-installer libswt-gtk-3-jni libcanberra-gtk-module

ADD http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/neon/3/eclipse-jee-neon-3-linux-gtk-x86_64.tar.gz /usr/local
RUN tar zxvf /usr/local/eclipse-jee-neon-3-linux-gtk-x86_64.tar.gz -C /usr/local \
 && rm /usr/local/eclipse-jee-neon-3-linux-gtk-x86_64.tar.gz

RUN apt-get install -y sudo \
 && useradd -mU eclipser \
 && echo "eclipser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/eclipser \
 && chmod 440 /etc/sudoers.d/eclipser

USER eclipser
ENV HOME /home/eclipser 
WORKDIR /home/eclipser

CMD /usr/local/eclipse/eclipse
