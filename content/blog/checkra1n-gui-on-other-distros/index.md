---

title: Checkra1n GUI on other Linux distros
date: 2021-03-25T21:19:51-05:00
lastmod: 2021-10-16T21:25:38-05:00
toc: true
comments: true

authors:
  - bbaovanc

categories:
  - guides

tags:
  - arch-linux
  - checkra1n
  - jailbreak
  - linux

resources:
  - name: feature
    src: gui.webp
    title: Checkra1n GUI running on Arch Linux

---

You can run the GUI version of checkra1n on non Debian-based distributions.

<!--more-->

## Introduction

The official cross-distribution build of checkra1n only contains a CLI and TUI.
However, the version available in the
[checkra1n APT repository](https://checkra.in/linux) also contains a GTK-based
GUI which can be accessed using the `--gui` flag, or the included
`checkra1n.desktop` file.

## Other Distributions

First, download the Debian package available at
`https://assets.checkra.in/debian/checkra1n_VERSION_amd64.deb` (as of writing,
`VERSION` is currently `0.12.2`). Then, extract the `checkra1n` executable from
the package, and install the correct shared libraries. Here are the most
important ones, and their corresponding package names on Arch Linux:

- libimobiledevice-1.0.so.6 (`libimobiledevice`)
- libirecovery-1.0.so.3 (`libirecovery`)
- libtvcontrol.so (`libtvcontrol`)
- libplist-2.0.so.3 (`libplist`)
- libncurses.so.5 (`ncurses5-compat-libs`)

I found these by running the binary and then finding and installing the package
that contained the shared object I was missing.

I also made an AUR package named
[`checkra1n-gui`](https://aur.archlinux.org/packages/checkra1n-gui),
which does all this automatically.

## Conclusion

As I expected, there is nothing preventing the checkra1n GUI from working on non
Debian-based distributions (as far as I can tell).
