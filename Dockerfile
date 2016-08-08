FROM linuxserver/baseimage.python
MAINTAINER Stian Larsen <lonixx@gmail.com>

# set python to use utf-8 rather than ascii, hopefully resolve special characters in movie names
ENV PYTHONIOENCODING="UTF-8"

#Mappings and Ports
EXPOSE 5050
VOLUME /config /downloads /movies

#Adding Custom files
COPY etc /etc/
