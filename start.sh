#!/bin/sh
darkhttpd /aria2/webui --port 80 &
aria2c --conf-path=/aria2/aria2.conf
