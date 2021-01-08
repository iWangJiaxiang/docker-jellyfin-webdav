#!/bin/bash

if [[ -n "$WEBDAV_USERNAME" ]] && [[ -n "$WEBDAV_PASSWORD" ]]
then
    echo Setting WebDAV Auth...    
	htpasswd -bc /etc/nginx/htpasswd "$WEBDAV_USERNAME" "$WEBDAV_PASSWORD"
	echo Done.
else
    echo Using NO WebDAV Auth.
	sed -i 's%auth_basic "Restricted";% %g' /etc/nginx/conf.d/default.conf
	sed -i 's%auth_basic_user_file htpasswd;% %g' /etc/nginx/conf.d/default.conf
fi

echo Launching Nginx WebDAV Server...
nginx -g "daemon off;" &

echo Launching Jellyfin Server...
# launch Jellyfin
./jellyfin/jellyfin \
    --datadir /config \
    --cachedir /cache \
    --ffmpeg /usr/lib/jellyfin-ffmpeg/ffmpeg