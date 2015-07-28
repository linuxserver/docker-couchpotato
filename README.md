![http://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](http://linuxserver.io) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](http://forum.linuxserver.io) or for real-time support our [IRC](http://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/couchpotato

![](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/couchpotato-icon.png)

[CouchPotato](https://couchpota.to) is an automatic NZB and torrent downloader. You can keep a "movies I want" list and it will search for NZBs/torrents of these movies every X hours. Once a movie is found, it will send it to SABnzbd or download the torrent to a specified directory.

## Usage

```
docker create \
	--name=couchpotato \
	-v /etc/localtime:/etc/localtime:ro \
	-v <path to data>:/config \
	-v <path to data>:/downloads \
	-v <path to data>:/movies \
	-e PGID=<gid> -e PUID=<uid>  \
	-p 5050:5050 \
	linuxserver/couchpotato
```

**Parameters**

* `-p 5050` - the port(s)
* `-v /etc/localhost` for timesync - *optional*
* `-v /config` - Couchpotato Application Data
* `-v /downloads` - Downloads Folder
* `-v /movies` - Movie Share
* `-e PGID` for for GroupID - see below for explanation
* `-e PUID` for for UserID - see below for explanation

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it couchpotato /bin/bash -l`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Updates

* Upgrade to the latest version simply `docker restart couchpotato`.
* To monitor the logs of the container in realtime `docker logs -f couchpotato`.

## Version Log

+ **28.07.15:** Updated to latest baseimage (for testing), and a fix to autoupdate. 