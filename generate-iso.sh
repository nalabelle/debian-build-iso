#!/bin/sh
set -ex
lb config \
  --distribution stretch \
  --architectures=amd64 \
  --binary-images iso-hybrid \
  --debian-installer false \
  --iso-volume "Debian Stretch ZFS Live" \
  --archive-areas "main contrib non-free" \
  --linux-packages "linux-image linux-headers" \
  --debootstrap-options "--include=apt-transport-https,ca-certificates,openssl" \
  --memtest none \
  --zsync false
cp -av /config/* /build/config/ || :
lb bootstrap
lb chroot
lb binary
cp /build/live-image* /result/
