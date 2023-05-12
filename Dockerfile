FROM alpine

RUN apk update && apk add inotify-tools bash

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
