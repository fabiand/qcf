#!/usr/bin/bash

build()
{
	podman build --tag qcf:latest .
}

run()
{
	time podman run --rm -it --memory 64m qcf:latest
}

push()
{
	podman push qcf:latest quay.io/fdeutsch/qcf:latest
}

$@
