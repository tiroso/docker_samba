# docker_samba

docker build https://github.com/tiroso/docker_samba.git#master  --tag tiroso/samba

docker run -dt -v $PWD/smb.conf:/etc/samba/smb.conf -v fhem-smartvisu:/share -p 445:445 --restart=always --name samba tiroso/samba


docker exec -it samba adduser -s /sbin/nologin -h /home/samba -H -D carol

docker exec -it samba smbpasswd -a carol






https://github.com/Stanback/alpine-samba
