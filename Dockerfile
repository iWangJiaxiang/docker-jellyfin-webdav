FROM jellyfin/jellyfin:10.6.4

RUN apt-get update && apt-get install -y nginx nginx-extras apache2-utils

EXPOSE 8088
COPY webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/*

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]