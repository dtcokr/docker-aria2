#!/bin/sh
chown -R ${PUID}:${PGID} /aria2
exec su-exec "${PUID}:${PGID}" \
  "/usr/bin/darkhttpd /aria2/webui --port 80 &" \
exec su-exec "${PUID}:${PGID}" \
  "/usr/bin/darkhttpd /downloads -p 81 &" \
exec su-exec "${PUID}:${PGID}" \
  "/usr/bin/aria2c --conf-path=/aria2/aria2.conf"
