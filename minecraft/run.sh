#!/bin/bash

sudo docker run -d \
	--name minecraft \
	-v /data \
	-p 25565:25565 \
	naelyn/minecraft
