FROM lsiobase/alpine.python:3.6
MAINTAINER sparklyballs

# set python to use utf-8 rather than ascii.
ENV PYTHONIOENCODING="UTF-8"

# add local files
COPY root/ /

# ports and volumes
EXPOSE 5050
WORKDIR /app/couchpotato
VOLUME /config /downloads /movies
