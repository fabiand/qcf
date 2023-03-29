qemu with file memory backend.

with file, limit 128 - churn
![](1g-guest-with-file-and-128m-limit.png)

without file, limit 128 - crash
![](1g-guest-without-file-and-128m-limit.png)

without file, limit 2 - churn
![](1g-guest-without-file-and-2g-limit.png)

with file, limit 2 - cache
![](1g-guest-with-file-and-2g-limit.png)
![](1g-guest-with-file-and-2g-limit-view-cache.png)

```
time qemu-system-x86_64 -accel kvm -snapshot -m 4G -smp 4 Fedora-Cloud-Base-37-1.7.x86_64.raw -nographic -serial mon:stdio -net user -net nic
sysbench memory --memory-block-size=1G --memory-total-size=50G --memory-oper=write --memory-access-mode=rnd --threads=1 run
```
