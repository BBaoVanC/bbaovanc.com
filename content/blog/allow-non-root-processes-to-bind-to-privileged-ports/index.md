---

title: Allow non root processes to bind to privileged ports in Linux
date: 2021-03-28T21:29:52-05:00
lastmod: 2022-05-02T01:05:44-05:00
toc: true
comments: true

authors:
  - bbaovanc

aliases:
  - posts/allow-non-root-processes-to-bind-to-privileged-ports/

tags:
  - guide
  - linux

---

In Linux, processes cannot bind to privileged ports (&lt;=1024) unless they are
running as root. Here's how to allow any process to bind to privileged ports.

<!--more-->

## Introduction

In Linux, processes cannot bind to privileged ports (&lt;=1024) unless they are
running as root. I learned about this when I was trying to add SSH cloning to my
[Gitea](https://gitea.io) instance. This can be bypassed by giving
`CAP_NET_BIND_SERVICE` capabilities to either the systemd service, or the
executable itself.

## Giving `CAP_NET_BIND_SERVICE` capabilities

### Using systemd (preferred)

The best way is to tell systemd to give `CAP_NET_BIND_SERVICE` capabilities to
the service. In fact, the Gitea systemd service has two
lines[^systemd-set-capabilities] that are commented out:

```systemd
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_BIND_SERVICE
```

Uncommenting these two lines was all I had to do for Gitea.

### Using `setcap`

You can add `CAP_NET_BIND_SERVICE` to the executable directly using `setcap`,
allowing it to bind to any port. Run the following command[^setcap-command]:

```bash
setcap 'cap_net_bind_service=+ep' /path/to/program
```

Note that this means that anyone with permission to run this program will be
able to run it and bind to any privileged ports.

Other caveats[^caveats-quote]:

> 1. You will need at least a 2.6.24 kernel
> 2. This won't work if your file is a script. (ie, uses a #! line to launch an
>    interpreter). In this case, as far I as understand, you'd have to apply the
>    capability to the interpreter executable itself, which of course is a
>    security nightmare, since any program using that interpreter will have the
>    capability. I wasn't able to find any clean, easy way to work around this
>    problem.
> 3. Linux will disable LD\_LIBRARY\_PATH on any program that has elevated
>    privileges like setcap or suid. So if your program uses its own .../lib/,
>    you might have to look into another option like port forwarding.


[^systemd-set-capabilities]: See [these two lines in the Gitea systemd service
  file](https://github.com/go-gitea/gitea/blob/3416e2a82586fca4cd452b93237b979300f55d62/contrib/systemd/gitea.service#L69)
  and [this Stack Overflow answer](https://stackoverflow.com/a/47065825).

[^setcap-command]: https://stackoverflow.com/a/414258
[^caveats-quote]: https://stackoverflow.com/a/414258
