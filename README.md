# docker-aria2

![Docker Pulls](https://img.shields.io/docker/pulls/dtcokr/aria2)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/dtcokr/docker-aria2/standalone)

Use aria2 in docker. 

[Aria2 Source(GitHub)](https://aria2.github.io/), conf file by [P3TERX(GitHub)](https://github.com/P3TERX/aria2.conf) which you **REALLY** should download to custom the settings that suits you. Tracker list by [ngosang(GitHub)](https://github.com/ngosang/trackerslist) and added to conf file by default to improve BT downloading.

## Usage

**The image with the tag `standalone` contains a WebUI(AriaNG as above) and can be used directly, and the image with the tag `latest` needs a WebUI (any Aria2 WebUI such as [AriaNG(GitHub)](https://github.com/mayswind/AriaNg) and [webui-aria2(GitHub)](https://github.com/ziahamza/webui-aria2) )to control the aria2 or via CLI in docker.**

### Tag `standalone`

*Using this image would be preferred unless you want to use other web ui's.*

Go to http://ip:8989 to control Aria2 using graphics interface. Go to http://ip:8181 to browser file index. Using [darkhttpd](https://unix4lyfe.org/darkhttpd/) as web server.

Change UID and GID if needed.

```sh
...
    -e PUID=1000
    -e PGID=1000
...
```

```sh
$ docker run -d \
    -p 6800:6800 \
    -p 8989:8989 \
    -p 8181:8181 \
    -v /path/to/your/aria2.conf:/aria2/aria2.conf \
    -v /path/to/save/file:/downloads \
    -e PUID=1000
    -e PGID=1000
    dtcokr/aria2:standalone
```

### Tag `latest`

Change UID and GID if needed.

```sh
...
    -e PUID=1000
    -e PGID=1000
...
```

```sh
$ docker run -d \
    -p 6800:6800 \
    -v /path/to/your/aria2.conf:/aria2/aria2.conf \
    -v /path/to/save/file:/downloads \
    -e PUID=1000
    -e PGID=1000
    dtcokr/aria2
```
