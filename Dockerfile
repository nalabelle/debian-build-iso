FROM debian:stretch
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      live-build \
      liblzo2-2 \
      squashfs-tools \
    && \
      mkdir /build /config /result
VOLUME ["/result", "/config"]
COPY ./generate-iso.sh /generate-iso.sh
WORKDIR /build
ENTRYPOINT ["/generate-iso.sh"]