# debian-build-iso
Builds a debian live boot image in docker. The general idea here is to set up an immutable boot USB for a docker host on my local network.

I have an internal SSD in the docker host machine, which keeps state. I prefer this over a mount since my NAS isn't configured for HA and likely never will be. I don't install the OS on the state drive due to the relative lack of support for ZFS on Linux. I prefer ZFS for the easy syncing, snapshotting, and cross-platform compatibility with my FreeBSD boxes. Has [provisioning](#provisioning) support for running a script out of the state drive on boot.

__Contains:__
 - docker
 - openssh-server
 - zfs
 - cifs
 - More, see [package lists](config/package-lists)

## Pre-boot setup
Image expects a zfs dataset at `/state/docker`. Set this up before trying to run docker.

~~~
root@debian:~# zfs list
NAME           USED  AVAIL  REFER  MOUNTPOINT
state          612K  26.9G    96K  /state
state/apps      96K  26.9G    96K  /state/apps
state/docker    96K  26.9G    96K  /state/docker
~~~

## <a name="provisioning">Provisoning</a>
If `/state/config/provision.sh` exists and is executable, it will be run at boot.

## Write to USB
- https://unix.stackexchange.com/questions/382817/uefi-bios-bootable-live-debian-stretch-amd64-with-persistence

## Research/Sources
- https://janvrany.github.io/2018/01/fun-with-zfs-part-2-creating-debian-zfs-rescue-usb-image.html
- https://unix.stackexchange.com/questions/71064/systemd-automate-modprobe-command-at-boot-time
- https://stackoverflow.com/questions/26406048/debootstrap-inside-a-docker-container
- https://manpages.debian.org/stretch/live-build/live-build.7.en.html
