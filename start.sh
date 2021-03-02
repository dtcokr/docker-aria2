#!/bin/sh
chown ${PUID}:${PGID} /aria2
exec su-exec "${PUID}:${PGID}" \
  "darkhttpd /aria2/webui --port 80 &" \
exec su-exec "${PUID}:${PGID}" \
  "darkhttpd /downloads -p 81 &" \
exec su-exec "${PUID}:${PGID}" \
  "aria2c --conf-path=/aria2/aria2.conf"
