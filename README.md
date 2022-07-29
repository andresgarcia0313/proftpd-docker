## proftpd



Spanish AND English:


SPANISH:
Una instalación fácil de usar, con todas las funciones de ProFTPD.
Configuraciones en variables de entorno

### Uso

cd docker
sh setiplocallinux.sh
docker-compose up -d

Conectar a ftp con Usuario:user y Contraseña:password y la dirección ip de su equipo 192.168.x.x


Para configurar una ip externa:
crear archivo en la carpeta docker llamado .env con ip local o externa:
PROFTPD_IP=yourIpLocalOrPublic

Personalizaciones en el archivo proftpd.conf y también con volumenes apuntando a /etc/proftpd.d y /etc/proftpd/modules.d.

Los permisos de archivo de linux se establecen en 666 que estan en el dockerfile con LOCAL_UMASK al colocar en esta variable 000 lo que hace proftpd para definirlos es restarlos a 666 por ende sería así 666-000=666, no se dejan con permisos de ejecución a los archivos para disminuir vulnerabilidades 


Gracias por usar esto cualquier mejora por favor indicarla en los issue de github y al correo andresgarcia0313@gmail.com


ENGLISH:

An easy-to-use, tiny yet full-featured installation of ProFTPD.

Fork of instantlinux/docker-tools, but without secret, all in environment variable (less secure, but for other workflow)

### Usage

User:user Password:password

create .env file with ip local:
PROFTPD_IP=192.168.1.81

or

create ftp.env file with ip public:
PROFTPD_IP=190.9.219.136


The most-common directives can be specified in environment variables as shown below. One is required, the PASV_ADDRESS. If you need further customizations, put them in one or more files under mount points /etc/proftpd.d and /etc/proftpd/modules.d.

A single upload user can be specified via the FTPUSER_xxx variables. It is activated by defining ftp-user-password-secret thus:


An example compose file is provided here in docker-compose.yml. This is for the common scenario of sharing from Docker swarm the contents of a network-attached volume as a read-only anonymous-ftp service.

### Variables

Variable | Default | Description |
-------- | ------- | ----------- |
ALLOW_OVERWRITE | on | allow clients to modify files
ANONYMOUS_DISABLE | off | anonymous login
ANON_UPLOAD_ENABLE | DenyAll | anonymous upload
FTPUSER_PASSWORD | password | pw of upload user
FTPUSER_NAME | user | upload username
FTPUSER_UID | 1001 | upload file ownership UID
LOCAL_UMASK | 000 | upload umask
MAX_CLIENTS | 10 | maximum simultaneous logins
MAX_INSTANCES | 30 | process limit
PASV_ADDRESS |  | required--address of docker engine
PASV_MAX_PORT | 30100 | range of client ports (rebuild image if changed)
PASV_MIN_PORT | 30091 | 
TIMES_GMT | off | local time for directory listing
TZ | UTC | local timezone
WRITE_ENABLE | AllowAll | allow put/rm


