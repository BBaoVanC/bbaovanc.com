{{< aside info >}}

Commands in this article are prefixed them with a prompt symbol (either `$` or
`#`) which is not part of the command. Lines with no prompt symbol are output
from the command.

The `#` means to run it as `root` (usually using `sudo`):

```bashsession
$ ls /var/lib/docker
ls: cannot open directory '/var/lib/docker': Permission denied

$ # this is a comment
$ # regular users aren't allowed to view /var/lib/docker, we need root

# ls /var/lib/docker
builder   containerd  image    overlay2  runtimes  tmp	 volumes
buildkit  containers  network  plugins	swarm	  trust

$ # we can do the same thing using sudo

$ sudo ls /var/lib/docker
[sudo] password for bbaovanc:
builder   containerd  image    overlay2  runtimes  tmp	 volumes
buildkit  containers  network  plugins	swarm	  trust
```

If you want to copy just the commands (for example: pasting them into your own
terminal to run them all), press the [Copy](javascript:void(0)) button in the top right of the code
block.

{{< /aside >}}
