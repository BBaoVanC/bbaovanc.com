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

There is a lot of conflicting information out there on how to create a swapfile
correctly. Although these guides (should) all work perfeclty fine, I spent the
time to research and find out what is actually the most correct.

In summary: make sure to use the `dd` command to create the swapfile, and create
an fstab entry that looks similar to `/swapfile none swap sw 0 0`. In this
article, I will go more in-depth into the correct steps to create a swapfile on
Linux, and explain each step.

<!--more-->

## Tutorial

{{< include path="include/bashsession.md" markdown=true >}}

### Step 1: Create the file

The first step is to allocate the file.

```bashsession
# dd if=/dev/zero of=/swapfile bs=1M count=[size in MiB] status=progress
```

Replace `[size in MiB]` with the size of your swapfile in Mebibytes (MiB). You
can use [this online converter](https://www.convertunits.com/from/GiB/to/MiB) to
convert from Gibibytes (GiB, often confused with Gigabytes, but that doesn't
matter right now) to MiB, which you can put in the command.

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

{{< aside example >}}

To create a swapfile 4 GiB in size, you would run:

```bashsession
# dd if=/dev/zero of=/swapfile bs=1M count=4096 status=progress
4096+0 records in
4096+0 records out
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 0.960183 s, 4.5 GB/s
```

{{< /aside >}}

If you aren't sure how big your swapfile should be, take a look at the [Ubuntu
Swap FAQ][ubuntu-swapfaq]. It has a table of common RAM sizes and how much swap
you should use.

[ubuntu-swapfaq]: https://help.ubuntu.com/community/SwapFaq#How_much_swap_do_I_need.3F

However, I would take it with a grain of salt; for the with hibernation column,
you probably don't need as much as it says. On my computer I have 32 GiB of RAM,
but only a 16 GiB swap partition.[^expand-swap-easily-lvm]

Remember that if that's not enough, you can add always multiple swapfiles later.

[^expand-swap-easily-lvm]: If it's not enough, I can still expand the partition
  easily since I use [LVM](https://wiki.archlinux.org/title/LVM) on my drive.

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
`sw` option [isn't valid for `swapon` and is ignored][swapon-options-source].
However, the field does need to be filled out with something, so feel free to
put something funny (do let me know in the comments if this somehow breaks
something though).

[swapon-options-source]: https://github.com/util-linux/util-linux/blob/2ea397239683270a0fc8cd3b72ed5457f52dbda8/sys-utils/swapon.c#L699

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
