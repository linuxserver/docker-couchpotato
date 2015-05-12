FROM phusion/baseimage:0.9.13
MAINTAINER Stian Larsen <lonixx@gmail.com>
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#Apt Patch 
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"
RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy python wget unrar git

# Make a folder for git to push to.
RUN mkdir /opt/couchpotato


#Mappings and Ports
EXPOSE 5050
VOLUME /config
VOLUME /downloads
VOLUME /movies

#Adding Custom files. 

RUN mkdir /etc/service/couchpotato
ADD couchpotato.run /etc/service/couchpotato/run
ADD update.init /etc/my_init.d/10_updateCouchpotato.sh
RUN chmod +x /etc/service/couchpotato/run
RUN chmod +x /etc/my_init.d/10_updateCouchpotato.sh



#Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

