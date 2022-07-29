#!/bin/sh -e
if [ ! -f /etc/timezone ] && [ ! -z "$TZ" ]; then
  # At first startup, set timezone
  cp /usr/share/zoneinfo/$TZ /etc/localtime
  echo $TZ >/etc/timezone
fi
  adduser -u $FTPUSER_UID -s /bin/sh -g "ftp user" -D $FTPUSER_NAME
  echo "$FTPUSER_NAME:$FTPUSER_PASSWORD" | chpasswd 
mkdir -p /run/proftpd && chown proftpd /run/proftpd/
sed -i \
    -e "s:{{ ALLOW_OVERWRITE }}:$ALLOW_OVERWRITE:" \
    -e "s:{{ ANONYMOUS_DISABLE }}:$ANONYMOUS_DISABLE:" \
    -e "s:{{ ANON_UPLOAD_ENABLE }}:$ANON_UPLOAD_ENABLE:" \
    -e "s:{{ LOCAL_UMASK }}:$LOCAL_UMASK:" \
    -e "s:{{ MAX_CLIENTS }}:$MAX_CLIENTS:" \
    -e "s:{{ MAX_INSTANCES }}:$MAX_INSTANCES:" \
    -e "s:{{ PASV_ADDRESS }}:$PASV_ADDRESS:" \
    -e "s:{{ PASV_MAX_PORT }}:$PASV_MAX_PORT:" \
    -e "s:{{ PASV_MIN_PORT }}:$PASV_MIN_PORT:" \
    -e "s+{{ SERVER_NAME }}+$SERVER_NAME+" \
    -e "s:{{ TIMES_GMT }}:$TIMES_GMT:" \
    -e "s:{{ WRITE_ENABLE }}:$WRITE_ENABLE:" \
    /etc/proftpd/proftpd.conf
if [ "$PASV_ADDRESS" = "" ] 
then
sed -i -e 's#.*MasqueradeAddress.*##g' /etc/proftpd/proftpd.conf
fi
exec proftpd --nodaemon -c /etc/proftpd/proftpd.conf