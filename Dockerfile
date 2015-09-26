FROM linuxserver/baseimage
MAINTAINER Stian Larsen <lonixx@gmail.com>

# set locale envs
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# Set the locale
RUN locale-gen en_US.UTF-8

# Install Depends
RUN apt-get update -q && \
apt-get install -qy python python-lxml python-openssl wget unrar git && \
apt-get clean && \
curl -o /tmp/rar.tar.gz http://www.rarlab.com/rar/rarlinux-x64-5.2.1b2.tar.gz&& \
tar xvf /tmp/rar.tar.gz  -C /tmp && \
cp -v /tmp/rar/*rar /usr/bin/ && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

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
