FROM phusion/baseimage:0.9.15
MAINTAINER Stian Larsen <lonixx@gmail.com>
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV TERM screen

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install Depends
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse" && \
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse" && \
apt-get update -q && \
apt-get install -qy python wget unrar git && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
RUN mkdir /opt/couchpotato

#Mappings and Ports
EXPOSE 5050
VOLUME /config
VOLUME /downloads
VOLUME /movies

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh
 
#Adduser
RUN useradd -u 911 -U -s /bin/false abc
RUN usermod -G users abc
