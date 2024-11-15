---

title: How to create (or remove) a swapfile on Linux
date: 2023-04-04T17:26:44-05:00
lastmod: 2023-04-04T17:26:44-05:00
toc: true
comments: true

authors:
  - bbaovanc

categories:
  - guides
  - tips-and-tricks

tags:
  - linux
  - linux-swap
  - swapfile

---

This is a step-by-step tutorial on how to create or remove a swapfile on a Linux
machine, and whether you should create swap space in the first place.

Also included is the most correct `fstab` entry: most articles get this "wrong"
(but it doesn't actually matter).

<!--more-->

## Should you use swap?

A common misconception is that adding swap to your system can reduce
performance. However, even if you aren't running out of RAM, it can still be
beneficial to add swap.

See these points according to [an article by Hayden James][always-add-swap]:

> - Even if there is still available RAM, the Linux Kernel will **move memory
>   pages that are hardly ever used** into swap space.
>
> - It’s better to swap out memory pages that have been inactive for a while,
>   **keeping often-used data in cache**, and this should happen when the server
>   is most idle, which is the aim of the Kernel.
>
> - Avoid setting your swap space too large if it will result in prolonging
>   performance issues, outages, or your response time (without proper
>   monitoring/alerts).

[always-add-swap]: https://haydenjames.io/linux-performance-almost-always-add-swap-space/

### Should you use a swap file or partition?

Swap partitions should be preferred because swapfiles tend to be slower and
slightly more complex to set up, especially if hibernating. A swapfile might be
preferred due to its flexibility (ease to resize), but if you use
[LVM][lvm-archwiki] then you can easily resize the swap partition anyways.

[lvm-archwiki]: https://wiki.archlinux.org/title/LVM

## Tutorial

{{< include path="include/console.md" markdown=true >}}

### Step 1: Create the file

The first step is to allocate the file.

```console
# dd if=/dev/zero of=/swapfile bs=1M count=[size in MiB] status=progress
```

Replace `[size in MiB]` with the size of your swapfile in Mebibytes (MiB). You
can use [this online converter](https://www.convertunits.com/from/GiB/to/MiB) to
convert from Gibibytes (GiB, often confused with Gigabytes, but that's a
misconception for another time) to MiB, which you can put in the command.

Or you can look at this table for common sizes:

| GiB | MiB         |
|-----|-------------|
| 1   | count=1024  |
| 2   | count=2048  |
| 3   | count=3072  |
| 4   | count=4096  |
| 8   | count=8192  |
| 16  | count=16384 |
{.simple}

If you aren't sure how big your swapfile should be, take a look at [Table 15.1
on this Red Hat documentation page][redhat-swap-table]. Remember that if your
first swapfile isn't large enough, you can create another one.

[redhat-swap-table]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/ch-swapspace#tb-recommended-system-swap-space

On my computer I have 32 GiB of RAM and a 16 GiB swap partition, rather than
swapfile, because I can flexibly expand the swap partition using
[LVM][lvm-archwiki].

{{< aside example >}}

To create a swapfile 4 GiB in size, you would run:

```console
# dd if=/dev/zero of=/swapfile bs=1M count=4096 status=progress
4096+0 records in
4096+0 records out
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 0.960183 s, 4.5 GB/s
```

{{< /aside >}}

### Step 2: Change swapfile permissions

The swapfile should only be readable by the system (`root` user). Run this
command to change it:

```console
# chmod 600 /swapfile
```

### Step 3: Format the swapfile

Use the `mkswap` command to format the file to be used as swap (basically just
add a header to identify it):

```console
# mkswap /swapfile
Setting up swapspace version 1, size = 4 GiB (4294963200 bytes)
no label, UUID=a0b87eca-b951-4344-be2d-020d77cdef48
```

### Step 4: Create an entry in `/etc/fstab`

An entry needs to be added to `/etc/fstab` for the swapfile to be enabled during
bootup. Open `/etc/fstab` in a text editor, and add this line to the end (add
spaces to line up with other entries if you want, whitespace is ignored):

```text
/swapfile none swap sw 0 0
```

{{< aside note >}}

Above, I have filled the "options" field with `sw`. Some guides suggest using
either `sw` or `defaults`. Neither of those options is valid for `swapon` and
they are both ignored. However, the field does need to be filled out with
something, so feel free to put something funny (do let me know in the comments
if this somehow breaks something though).

If you're curious, this is my `fstab` entry (`UUID` is because I use a swap
partition, rather than swapfile):

```text
# /dev/mapper/bobavg0-swap
UUID=4f7c3ae8-839b-4474-b8a5-96bd78db06f8 none swap bobaswap 0 0
```

{{< /aside >}}

### Step 5: Enable the swapfile

Adding the `fstab` entry won't enable the swapfile until a reboot. To enable it
now, use the `swapon` command.

```console
# swapon /swapfile
```

### Finally: check the swap status

Use `swapon` and `free` to verify that your new swapfile has been added:

```console
$ swapon --show
NAME       TYPE SIZE USED PRIO
/swapfile  file   4G   0B   -2

$ free -h
               total        used        free      shared  buff/cache   available
Mem:            31Gi       3.6Gi        20Gi       233Mi       6.9Gi        26Gi
Swap:          4.0Gi          0B       4.0Gi
```

{{< aside note >}}

If you get an error saying that the `swapon` command was not found, try running
it as `root` (using `sudo`). On Debian-based distributions the `swapon` command
is not available to regular users.

```console
$ swapon --show
bash: swapon: command not found

# swapon --show
NAME      TYPE SIZE USED PRIO
/swapfile file   4G   0B   -2
```

{{< /aside >}}

## Removing a swapfile

{{< aside warning >}}

Be careful that the swapfile isn't being highly used because once you run
`swapoff`, it will dump the entire contents back into RAM and may cause you to
run out of memory.

{{< /aside >}}

### Step 1: Disable/unload the swapfile

```console
$ swapon --show
NAME       TYPE SIZE USED PRIO
/swapfile  file   4G   0B   -2

$ # the path to the swapfile I want to remove is `/swapfile`

# swapoff /swapfile
```

### Step 2: Remove the entry from `fstab`

Open `/etc/fstab` in a text editor and find the line matching the swapfile you
want to remove, and delete it. For example:

```text
/swapfile none swap sw 0 0
```

### Step 3: Delete the actual file

```console
# rm /swapfile
```

## References

### Use `dd` instead of `fallocate`

See ["Files with holes" under the man page][swapon-holes-man].

[swapon-holes-man]: https://man.archlinux.org/man/core/util-linux/swapon.8.en#Files_with_holes

### The options field in fstab

On Linux, `sw` doesn't mean anything for `swapon`, so it gets ignored. See:

- [StackExchange answer 1](https://unix.stackexchange.com/a/365961/525130)
- [StackExchange answer 2](https://unix.stackexchange.com/a/365954/525130)
- [`parse_options` in the `swapon` source code](https://github.com/util-linux/util-linux/blob/2ea397239683270a0fc8cd3b72ed5457f52dbda8/sys-utils/swapon.c#L699)
- [options set by fstab `defaults` (none have any effect on `swapon`)](https://man.archlinux.org/man/fstab.5#The_fourth_field_(%3Ci%3Efs_mntops%3C/i%3E).)
