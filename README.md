# debian-build-iso
docker build a custom debian live image

## Pre-boot setup
~~~
root@debian:~# zfs list
NAME           USED  AVAIL  REFER  MOUNTPOINT
state          612K  26.9G    96K  /state
state/apps      96K  26.9G    96K  /state/apps
state/docker    96K  26.9G    96K  /state/docker
~~~

## Write to USB
- https://unix.stackexchange.com/questions/382817/uefi-bios-bootable-live-debian-stretch-amd64-with-persistence

## Research/Sources:
- https://janvrany.github.io/2018/01/fun-with-zfs-part-2-creating-debian-zfs-rescue-usb-image.html
- https://unix.stackexchange.com/questions/71064/systemd-automate-modprobe-command-at-boot-time
- https://stackoverflow.com/questions/26406048/debootstrap-inside-a-docker-container
- https://manpages.debian.org/stretch/live-build/live-build.7.en.html
