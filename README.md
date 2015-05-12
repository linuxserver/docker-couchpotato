# lonix/couchpotato


**sample create command:**
```
docker create --name=<name> -v /etc/localtime:/etc/localtime:ro -v <path to data>:/config -v <path to movies>:/movies -v <path to downloads>:/downloads -e PGID=<gid> -e PUID=<uid>  -p 5050:5050 lonix/couchpotato:2.0
```

**You need to map**

*  PORT: 80 for Web
*  MOUNT: /downloads for downloads
*  MOUNT: /etc/localhost for timesync (Not required)
*  MOUNT: /config for Configuration storage
*  MOUNT: /movies for Movies Collection
*  VARIABLE: PGID for for GroupID
*  VARIABLE: PUID for for UserID

It is based on phusion-baseimage with ssh removed. (use docker exec).


**Credits**
lonix <lonixx@gmail.com>

**Versions**
2.0: Fixed autoupdate and added gid/uid fix. 
1.0: Inital release

