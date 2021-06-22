FROM alpine

RUN apk update && apk add inotify-tools

VOLUME ["/input", "/output"]
ENTRYPOINT ["/bin/sh", "-c", "inotifywait -m -q -e close_write /input --format '%w%f' | while read file; do echo $file; mv -n \"$file\" /output; rm -f \"$file\"; done"]