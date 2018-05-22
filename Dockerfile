FROM webdevops/php-nginx:debian-8-php7
# Move server config files
COPY opt /
ADD . /app

RUN apt-get update && apt-get install -y nano memcached php-memcache && cd /app && composer install

ENV PHP_DISPLAY_ERRORS 1
ENV WEB_DOCUMENT_ROOT '/app/web'

ENV USER_NAME ${USER_NAME:-"admin"}
ENV USER_PASS ${USER_PASS:-"admin"}
ENV CLUSTER_NAME ${CLUSTER_NAME:-"My memcache"}
ENV MEMCACHE_HOST ${MEMCACHE_HOST:-"memcached"}
ENV MEMCACHE_PORT ${MEMCACHE_PORT:-"11211"}
ENV TRY_UNSERIALIZE ${TRY_UNSERIALIZE:-"false"}

EXPOSE 80/tcp
