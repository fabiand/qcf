#!/usr/bin/bash
set -x

truncate --size 4G /cache/qemu-mem

ARGS=""
[[ "$WITH_FILE" ]] && {
	ARGS+=" -object memory-backend-file,id=pc.ram,size=4G,mem-path=/cache/qemu-mem,share=on -machine memory-backend=pc.ram"
}

qemu-system-x86_64 -accel kvm -m 4G -smp 4 -nographic -serial mon:stdio -net user -net nic \
		$ARGS \
		-snapshot /disk.img
