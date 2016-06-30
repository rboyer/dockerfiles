FROM naelyn/java7

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install wget && \
	wget "https://s3.amazonaws.com/Minecraft.Download/versions/1.7.10/minecraft_server.1.7.10.jar" && \
	mkdir -p /app && \
	mv minecraft_server.1.7.10.jar /app && \
	ln -sf /app/minecraft_server.1.7.10.jar /app/minecraft_server.jar && \
	echo "eula=true" > /app/eula.txt && \
	useradd app && chown -R app:app /app && \
	mkdir -p /data

ADD start.sh /app/start.sh

WORKDIR /data
EXPOSE 25565

VOLUME ["/data"]

CMD ["/app/start.sh"]

