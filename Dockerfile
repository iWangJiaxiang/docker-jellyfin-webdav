FROM jellyfin/jellyfin:10.6.4

RUN apt-get update --allow-unauthenticated \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        nginx nginx-extras apache2-utils \
    && apt-get clean autoclean -y \
    && apt-get autoremove -y \
EXPOSE 8088
COPY webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/*

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]