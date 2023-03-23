#!/usr/bin/bash
set -x

truncate --size 1G /cache/qemu-mem

ARGS=""
[[ "$WITH_FILE" ]] && {
	ARGS+=" -object memory-backend-file,id=pc.ram,size=1G,mem-path=/cache/qemu-mem,share=on -machine memory-backend=pc.ram"
}

qemu-system-x86_64 -m 1G -smp 1 -display curses,charset=utf8 \
		$ARGS \
		-snapshot /mt86plus_6.10_64.iso
