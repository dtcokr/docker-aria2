FROM alpine:latest
LABEL maintainer "Dtcokr <dtcokr@outlook.com>"

COPY aria2.conf /aria2/aria2.conf
COPY dht.dat /aria2/dht.dat

RUN apk add --update --no-cache aria2 \
  && bt_tracker_list=$(wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt |awk NF|sed ":a;N;s/\n/,/g;ta") \
  && sed -i '$a bt-tracker='${bt_tracker_list} /aria2/aria2.conf \
  && touch /aria2/aria2.session

EXPOSE 6800
VOLUME /aria2 /downloads
WORKDIR /downloads

ENTRYPOINT ["aria2c", "--conf-path=/aria2/aria2.conf"]
