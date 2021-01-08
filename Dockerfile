FROM jellyfin/jellyfin:10.6.4

# remove jellyfin repo to avoid invalid signatures error
RUN [ -f "/etc/apt/sources.list.d/jellyfin.list" ] && rm -f "/etc/apt/sources.list.d/jellyfin.list"

# install nginx
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        nginx nginx-extras apache2-utils \
    && apt-get clean autoclean -y \
    && apt-get autoremove -y

EXPOSE 8088
COPY webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/*

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]