#!/bin/bash
if [ ! -d /app/couchpotato/.git ]; then 
	/sbin/setuser abc git clone https://github.com/RuudBurger/CouchPotatoServer.git /app/couchpotato
else
	cd /app/couchpotato
	/sbin/setuser abc git pull
fi
