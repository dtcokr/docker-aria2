#!/bin/sh
darkhttpd /aria2/webui --port 80 &
darkhttpd /downloads -p 81 &
aria2c --conf-path=/aria2/aria2.conf