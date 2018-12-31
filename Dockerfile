FROM debian:stretch
RUN apt-get update && \
    apt-get install -y \
      live-build \
      apt-transport-https \
    && \
      mkdir /build /config /result
VOLUME ["/result", "/config"]
WORKDIR /build
RUN lb config \
    --distribution stretch \
    --architectures=amd64 \
    --binary-images iso-hybrid \
    --debian-installer false \
    --iso-volume "Debian Stretch ZFS Live" \
    --archive-areas "main contrib non-free" \
    --linux-packages "linux-image linux-headers" \
    --debootstrap-options "--include=apt-transport-https,ca-certificates,openssl"
COPY ./generate-iso.sh /generate-iso.sh
ENTRYPOINT ["/generate-iso.sh"]
