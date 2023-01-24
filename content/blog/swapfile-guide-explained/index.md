---

title: Swapfile guide explained
date: 2023-01-23T20:26:18-06:00
lastmod: 2023-01-23T20:26:18-06:00
toc: true
comments: true
draft: true

authors:
  - bbaovanc

categories:
  - linux

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

This page is about something. All the content before the "more" HTML comment
below will become the summary, which will be used in list pages and in the meta
tags on the article.

Or, if you don't want your description to be at the top of the article, you can
set your own `description` in the front matter and it will override this. See
the [Content Summaries](https://gohugo.io/content-management/summaries/) page on
the Hugo docs for more information.

<!--more-->

## Allocating the file

- use `dd` instead of `fallocate`
- https://man7.org/linux/man-pages/man8/swapon.8.html#NOTES
  - https://man.archlinux.org/man/core/util-linux/swapon.8.en#Files_with_holes

## Options field

- https://unix.stackexchange.com/a/365961/525130
- https://unix.stackexchange.com/a/365954/525130
- https://github.com/util-linux/util-linux/blob/2ea397239683270a0fc8cd3b72ed5457f52dbda8/sys-utils/swapon.c#L699
