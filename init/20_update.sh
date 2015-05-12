#!/bin/bash
if [ ! -d /opt/couchpotato/.git ]; then 
	git clone https://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato
else
	cd /opt/couchpotato
	git checkout master
fi
chown -R abc:abc /opt/couchpotato
	#statements
