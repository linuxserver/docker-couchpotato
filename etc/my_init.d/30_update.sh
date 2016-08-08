#!/bin/bash

[[ ! -d /app/couchpotato/.git ]] && git clone \
https://github.com/CouchPotato/CouchPotatoServer /app/couchpotato

chown -R abc:abc /app/couchpotato

# opt out for autoupdates
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /app/couchpotato
git pull
chown -R abc:abc /app/couchpotato
