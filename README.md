# Jellyfin Docker Image With WebDAV Support

[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/sashgorokhov/docker-nginx-webdav)

This Image extends original [Jellyfin Docker Image](https://hub.docker.com/r/jellyfin/jellyfin) with additional Nginx WebDAV Support, to share Jellyfin media storage for better file management experience.

With WebDAV support, you could manage Jellyfin media data using NextCloud external storage feature.

## Supported tags and respective `Dockerfile` links

-	[`latest` (*Dockerfile*)](https://github.com/iWangJiaxiang/docker-jellyfin-webdav/blob/master/Dockerfile)

## How to use this image

Please read [Jellyfin Docker Installing Documentation](https://jellyfin.org/docs/general/administration/installing.html#docker) for basic usage.

This image exports `/media` container folder at port `8088` using WebDAV. Beside the official options, try following options for WebDAV feature.

- `-p 8088:8088` for WebDAV port
- `-e WEBDAV_USERNAME=xxx` for auth (optional)
- `-e WEBDAV_PASSWORD=xxx` for auth (optional)
- `-v /path/to/folder:/media` for Jellyfin data

## Supported Docker versions

This image is officially supported on Docker version 1.10.2.
Support for older versions (down to 1.6) is provided on a best-effort basis.
Please see [the Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.
