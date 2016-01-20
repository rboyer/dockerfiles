#!/bin/bash

set -e

if [ ! -e /data/eula.txt ]; then
	echo "eula=true" > /data/eula.txt
fi

cd /data

chown -R app:app /data

su -c 'java -Xms1G -Xmx1G -jar /app/minecraft_server.jar nogui' app

