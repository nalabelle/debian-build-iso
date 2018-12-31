#!/bin/bash
target = bin-x86_64-efi/ipxe.efi bin/ipxe.kpxe bin/undionly.kpxe
args = 
imagename = nalabelle/debian-build-iso
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

build:
	mkdir ./result || :
	docker build -t $(imagename) .
	docker run -v ${ROOT_DIR}/result/:/result/ $(imagename) $(target) $(args)

clean:
	rm -rf result/
	docker rmi -f $(imagename) || :
