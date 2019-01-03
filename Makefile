#!/bin/bash
IMAGENAME = nalabelle/debian-build-iso
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

build:
	mkdir ./result || :
	docker build -t $(IMAGENAME) .
	# uncomment for interactive
	#docker run --rm -it --privileged -v ${ROOT_DIR}/config:/config -v ${ROOT_DIR}/result:/result --entrypoint /bin/bash ${IMAGENAME}
	docker run --rm --privileged -v ${ROOT_DIR}/config:/config -v ${ROOT_DIR}/result:/result ${IMAGENAME}

clean:
	rm -rf result/
	docker rmi -f $(IMAGENAME) || :
