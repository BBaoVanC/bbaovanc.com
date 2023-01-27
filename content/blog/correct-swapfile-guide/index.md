---

title: Guide to the correct swapfile setup
date: 2023-01-23T20:26:18-06:00
lastmod: 2023-01-23T20:26:18-06:00
toc: true
comments: true
draft: true

authors:
  - bbaovanc

categories:
  - guides
  - linux
  - tips-and-tricks

tags:
  - linux-swap
  - swapfile

series:
  - swapfile-guide

# this will be shown for the article in list pages and in the page metadata
# it can be either an image or video (this might change in the future, however)
resources:
  - name: feature
    src: something.webp
    title: Some image (image format can be anything; webp is just an example)

---

This is a step-by-step tutorial on how to create or remove a swapfile on a Linux
machine. Also included is the correct `fstab` entry (most articles get this
"wrong", though it doesn't really make a difference) and reasons to use
swap(file) in the first place.

<!--more-->

## Should you use swap?

A common misconception is that adding swap to your system can reduce
performance. In reality, even if you aren't running out of RAM, it can still be
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

### Should you use a swapfile?

Swap partitions should be preferred because swapfiles tend to be slower and more
complex, especially if hibernating. A swapfile might be preferred due to its
flexibility (easy to resize), but if you use [LVM][lvm-archwiki] then you can
easily resize the swap partition anyways.

[lvm-archwiki]: https://wiki.archlinux.org/title/LVM

## Tutorial

{{< include path="include/bashsession.md" markdown=true >}}

### Step 1: Create the file

The first step is to allocate the file.

```bashsession
# dd if=/dev/zero of=/swapfile bs=1M count=[size in MiB] status=progress
```

Replace `[size in MiB]` with the size of your swapfile in Mebibytes (MiB). You
can use [this online converter](https://www.convertunits.com/from/GiB/to/MiB) to
convert from Gibibytes (GiB, often confused with Gigabytes, but that's a
misconception for another time) to MiB, which you can put in the command.

Or you can look at this table for common sizes:

{{< table >}}
| GiB | MiB         |
|-----|-------------|
| 1   | count=1024  |
| 2   | count=2048  |
| 3   | count=3072  |
| 4   | count=4096  |
| 8   | count=8192  |
| 16  | count=16384 |
{{< /table >}}

If you aren't sure how big your swapfile should be, take a look at [Table 15.1
on this Red Hat documentation page][redhat-swap-table]. Remember that if your
first swapfile isn't large enough, you can create another one.

[redhat-swap-table]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/ch-swapspace#tb-recommended-system-swap-space

On my computer I have 32 GiB of RAM and a 16 GiB swap partition, rather than
swapfile, because I can flexibly expand the swap partition using
[LVM][lvm-archwiki].

{{< aside example >}}

To create a swapfile 4 GiB in size, you would run:

```bashsession
# dd if=/dev/zero of=/swapfile bs=1M count=4096 status=progress
4096+0 records in
4096+0 records out
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 0.960183 s, 4.5 GB/s
```

{{< /aside >}}

### Step 2: Change swapfile permissions

The swapfile should only be readable by the system (`root` user). Run this
command to change it:

```bashsession
# chmod 600 /swapfile
```

### Step 3: Format the swapfile

Use the `mkswap` command to format the file to be used as swap (basically just
add a header to identify it):

```bashsession
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

Above, I have filled the "options" field with `sw`. This is actually a result of
[cargo culting](https://en.wiktionary.org/wiki/cargo_culting). On Linux, the
`sw` option (and the [options specified by the commonly used
`defaults`][fstab-defaults-man]) [isn't valid for `swapon` and is
ignored][swapon-options-source]. However, the field does need to be filled out
with something, so feel free to put something funny (do let me know in the
comments if this somehow breaks something though).

[fstab-defaults-man]: https://man.archlinux.org/man/fstab.5#The_fourth_field_(%3Ci%3Efs_mntops%3C/i%3E).
[swapon-options-source]: https://github.com/util-linux/util-linux/blob/2ea397239683270a0fc8cd3b72ed5457f52dbda8/sys-utils/swapon.c#L699

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

```bashsession
# swapon /swapfile
```

### Finally: check the swap status

Use `swapon` and `free` to verify that your new swapfile has been added:

```bashsession
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

```bashsession
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

```bashsession
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

```bashsession
# rm /swapfile
```
