FROM lsiobase/alpine.python
MAINTAINER sparklyballs

# set python to use utf-8 rather than ascii, hopefully resolve special characters in movie names
ENV PYTHONIOENCODING="UTF-8"

#Adding Custom files
COPY root/ /

#Mappings and Ports
WORKDIR /app/couchpotato
EXPOSE 5050
VOLUME /config /downloads /movies
