FROM debian:stretch
RUN apt-get update && \
    apt-get install -y live-build && \
    mkdir /build /result
VOLUME ["/result"]
WORKDIR /build
RUN lb config \
    --distribution stretch \
    --architectures=amd64 \
    --binary-images iso-hybrid \
    --iso-volume "Debian Stretch ZFS Live" \
    --archive-areas "main contrib" \
    --linux-packages "linux-image linux-headers"
COPY . /
ENTRYPOINT ["/build/generate-iso.sh"]
