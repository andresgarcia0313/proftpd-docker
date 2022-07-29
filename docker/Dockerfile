FROM alpine:3.16.1
ENV ALLOW_OVERWRITE=on \
    ANONYMOUS_DISABLE=off \
    ANON_UPLOAD_ENABLE=DenyAll \
    FTPUSER_PASSWORD=password \
    FTPUSER_NAME=user \
    FTPUSER_UID=1001 \
    LOCAL_UMASK=000 \
    MAX_CLIENTS=10 \
    MAX_INSTANCES=30 \
    PASV_ADDRESS= \
    PASV_MAX_PORT=30100 \
    PASV_MIN_PORT=30091 \
    SERVER_NAME=ProFTPD \
    TIMES_GMT=off \
    TZ=UTC \
    WRITE_ENABLE=AllowAll
RUN apk add --update proftpd tzdata
COPY proftpd.conf /etc/proftpd/proftpd.conf
VOLUME /etc/proftpd/conf.d /etc/proftpd/modules.d /var/lib/ftp
EXPOSE 21 $PASV_MIN_PORT-$PASV_MAX_PORT
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]