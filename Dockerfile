FROM alpine:latest
LABEL maintainer "Dtcokr <dtcokr@outlook.com>"

COPY aria2.conf /aria2/aria2.conf
COPY dht.dat /aria2/dht.dat
COPY start.sh /aria2/start.sh

RUN apk add --update --no-cache aria2 darkhttpd unzip su-exec \
  && bt_tracker_list=$(wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt |awk NF|sed ":a;N;s/\n/,/g;ta") \
  && sed -i '$a bt-tracker='${bt_tracker_list} /aria2/aria2.conf \
  && touch /aria2/aria2.session \
  && wget https://github.com/mayswind/AriaNg/releases/download/1.2.1/AriaNg-1.2.1.zip \
  && mkdir /aria2/webui \
  && unzip AriaNg-1.2.1.zip -d /aria2/webui \
  && chmod +x /aria2/start.sh

ENV PUID=1000 PGID=1000
EXPOSE 6800 80 81
VOLUME /aria2 /downloads
WORKDIR /downloads

COMMAND ["/aria2/start.sh"]
