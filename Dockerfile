FROM debian:latest

RUN apt update && apt-get update \
	&& apt-get install curl python -y \
	&& curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl \
	&& chmod a+rx /usr/local/bin/youtube-dl 

ADD youtube-download /opt/youtube-download

ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh
RUN chmod +x /opt/youtube-download

ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]
