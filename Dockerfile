FROM alpine
ADD plugin.sh /bin/
RUN chmod +x /bin/plugin.sh
RUN apk -Uuv add openssh
ENTRYPOINT /bin/plugin.sh