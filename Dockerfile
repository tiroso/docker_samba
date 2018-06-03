FROM alpine:edge

RUN apk add --update \
    samba-common-tools \
    samba-server \
    && rm -rf /var/cache/apk/*

mkdir /share
chmod 0777 /share

RUN echo "[global]" > /etc/samba/smb.conf \
echo "workgroup = WORKGROUP" >> /etc/samba/smb.conf \
echo "dos charset = cp850" >> /etc/samba/smb.conf \
echo "unix charset = ISO-8859-1" >> /etc/samba/smb.conf \
echo "force user = username" >> /etc/samba/smb.conf \
echo "" >> /etc/samba/smb.conf \
echo "[storage]" >> /etc/samba/smb.conf \
echo "browseable = yes" >> /etc/samba/smb.conf \
echo "writeable = yes" >> /etc/samba/smb.conf \
echo "path = /share" >> /etc/samba/smb.conf \
useradd -m smbuser \
(echo "password"; sleep 1; echo "password";) | passwd smbuser \
(echo "password"; sleep 1; echo "password" ) | sudo smbpasswd -s -a smbuser

ENTRYPOINT ["smbd", "--foreground", "--log-stdout"]
CMD []
