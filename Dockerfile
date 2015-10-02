FROM linuxserver/baseimage.python
MAINTAINER Stian Larsen <lonixx@gmail.com>

# set python to use utf-8 rather than ascii, hopefully resolve special characters in movie names
ENV PYTHONIOENCODING="UTF-8"

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
