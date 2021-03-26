+++
title = "Checkra1n GUI on Other Distros"
date = "2021-03-25T21:19:51-05:00"
author = "bbaovanc"
cover = "/blog/media/checkra1n-gui-on-arch-linux.png"
tags = ["linux", "archlinux", "jailbreak", "checkra1n"]
keywords = ["checkra1n", "gui", "linux", "arch linux"]
description = "You can run the GUI version of checkra1n on non Debian-based distributions. (The GUI looks garbled here because I have a high DPI monitor)"
showFullContent = false
toc = true
+++

*The GUI above looks garbled because I have a high DPI monitor.*

## Introduction

The official cross-distribution build of checkra1n only contains a CLI and TUI. However, the version available in the [checkra1n APT repository](https://checkra.in/linux) also contains a GTK-based GUI which can be accessed using the `--gui` flag, or the included `checkra1n.desktop` file.

## Other Distributions

First, download the package, availabe at `https://assets.checkra.in/debian/checkra1n\_VERSION\_amd64.deb` (as of writing, `VERSION` is currently `0.12.2`). Then, extract the `checkra1n` executable from the package, and install the correct shared libraries. Here are the most important ones, and their corresponding package names on Arch Linux:

- libimobiledevice-1.0.so.6 (`libimobiledevice`)
- libirecovery-1.0.so.3 (`libirecovery`)
- libtvcontrol.so (`libtvcontrol`)
- libplist-2.0.so.3 (`libplist`)
- libncurses.so.5 (`ncurses5-compat-libs`)

I found these by running the binary and then finding and installing the package that contained the shared object file I was missing.

I also made an AUR package named [`checkra1n-gui`](https://aur.archlinux.org/packages/checkra1n-gui), which does all this automatically.

## Conclusion

As I expected, there is nothing preventing the checkra1n GUI from working on non Debian-based distributions (as far as I can tell).
