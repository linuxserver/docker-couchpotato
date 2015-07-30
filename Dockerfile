FROM linuxserver/baseimage
MAINTAINER Stian Larsen <lonixx@gmail.com>
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install Depends
RUN apt-get update -q && \
apt-get install -qy python wget unrar git && \
apt-get clean && \
curl -o /tmp/rar.tar.gz http://www.rarlab.com/rar/rarlinux-x64-5.2.1b2.tar.gz&& \
tar xvf /tmp/rar.tar.gz  -C /tmp && \
cp -v /tmp/rar/*rar /usr/bin/ && \
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
