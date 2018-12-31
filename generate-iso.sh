#!/bin/sh
set -ex
cp -av /config/* /build/config/ || :
cd /build
lb bootstrap
lb chroot
lb binary
cp live-image* /result/
