#!/bin/sh
exec su-exec ${PUID}:${PGID} \
  aria2c --conf-path=/aria2/aria2.conf
