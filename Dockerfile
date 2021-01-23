FROM ghcr.io/linuxserver/baseimage-alpine:3.13

# set version label
ARG BUILD_DATE
ARG VERSION
ARG COUCHPOTATO_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="aptalca"

# set python to use utf-8 rather than ascii.
ENV PYTHONIOENCODING="UTF-8"

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	curl \
	python2 \
	unrar \
	unzip && \
 echo "**** install app ****" && \
 mkdir -p \
	/app/couchpotato && \
 if [ -z ${COUCHPOTATO_RELEASE+x} ]; then \
 	COUCHPOTATO_RELEASE=$(curl -sX GET "https://api.github.com/repos/CouchPotato/CouchPotatoServer/commits/master" \
        | awk '/sha/{print $4;exit}' FS='[""]'); \
 fi && \
 curl -o \
	/tmp/couchpotato.tar.gz -L \
	"https://github.com/CouchPotato/CouchPotatoServer/archive/${COUCHPOTATO_RELEASE}.tar.gz" && \
 tar xf /tmp/couchpotato.tar.gz -C \
	/app/couchpotato --strip-components=1 && \
 echo "**** Cleanup ****" && \
 rm -Rf /tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 5050
WORKDIR /app/couchpotato
VOLUME /config
