#!/bin/bash
[[ ! -d /app/couchpotato/.git ]] && /sbin/setuser abc git clone https://github.com/RuudBurger/CouchPotatoServer.git /app/couchpotato

# opt out for autoupdates
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /app/couchpotato
/sbin/setuser abc git pull

