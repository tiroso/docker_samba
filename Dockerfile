FROM alpine:3.7

RUN apk add --update \
    samba-common-tools=4.8.2 \
    samba-client=4.8.2 \
    samba-server=4.8.2 \
    && rm -rf /var/cache/apk/*

EXPOSE 445/tcp

ENTRYPOINT ["smbd", "--foreground", "-i", "--log-stdout"]
CMD []
