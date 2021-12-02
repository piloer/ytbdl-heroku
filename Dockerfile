FROM debian:latest

RUN apt update && apt-get update \
	&& apt-get install -y curl python python3   \
	&& curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/youtube-dl \
	&& chmod a+rx /usr/local/bin/youtube-dl 

ADD youtube-download /opt/youtube-download

ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod a+x /opt/entrypoint.sh
RUN chmod a+x /opt/youtube-download

ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]
