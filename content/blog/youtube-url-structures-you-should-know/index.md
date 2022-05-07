---

title: Youtube URL structures you should know
date: 2021-10-30T21:20:38-05:00
lastmod: 2022-05-02T00:59:25-05:00
toc: true
comments: true

authors:
  - bbaovanc

categories:
  - tips-and-tricks

tags:
  - query-parameters
  - url-structures
  - youtube

resources:
  - name: feature
    src: youtube-url.webp
    title: YouTube URL

  - name: mdn-url-parameters
    src: mdn-url-parameters@x2.png
    title: >-
      [What is a
      URL?](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_URL#parameters)
      by [Mozilla
      Contributors](https://developer.mozilla.org/en-US/docs/MDN/About/contributors.txt)
      is licensed under [CC-BY-SA
      2.5](https://creativecommons.org/licenses/by-sa/2.5/)

---

Knowing the basic structure and parameters in a YouTube URL can come in handy on
the occasion you need it. Here's how to find the video ID, link to a specific
timestamp, and more.

<!--more-->

## What is youtu.be?

YouTube has its own domain for [URL
shortening](https://en.wikipedia.org/wiki/URL_shortening): `youtu.be`. It's
roughly equivalent to `youtube.com/watch`.

## Query parameter basics

Query parameters can be added to a URL just by suffixing it with something like
`?key=value&something=else`. That example sets `key` to `value` and `something`
to `else`. Note how the first parameter is prefixed with `?`, and then the
following parameters are separated with `&`.

{{< figure src="mdn-url-parameters" >}}

See the [page on the Mozilla Developer
Docs](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_URL)
for more information on the anatomy of a URL.

## Linking to a video

Here's the video I'll be using as an example:

{{< youtube F6va6tg62qg >}}

I embedded that video on my website with this code:[^hugo-shortcode]

```text
{{</* youtube F6va6tg62qg */>}}
```

The argument there (`F6va6tg62qg`) is the video ID, which is the unique
identifier for the video. Here's how the YouTube URLs for that video look:

- https://www.youtube.com/watch?v=F6va6tg62qg
- https://youtu.be/F6va6tg62qg

Take note that on `youtube.com`, the video ID is provided as a [query
parameter](#query-parameter-basics), and on `youtu.be`, it's just provided as
the path of the URL.

## Linking a specific timestamp

You can add the `t=` parameter to the URL to have it automatically seek to a
specific timestamp when opened. The value can be expressed in hours, minutes,
and seconds (using `h`, `m`, and `s` respectively). Here's how that looks:

- https://www.youtube.com/watch?v=F6va6tg62qg&t=14s
- https://youtu.be/F6va6tg62qg?t=14s

Unfortunately my example video isn't long enough to show hours or minutes, so
here's a different one:

- https://www.youtube.com/watch?v=dQw4w9WgXcQ&t=3m14s
- https://youtu.be/dQw4w9WgXcQ?t=3m14s

Those link 3 minutes and 14 seconds into the video. Notice how the `youtube.com`
link prefixes the `t=` parameter with an `&` since it's the second parameter.
The `youtu.be` link just uses a `?` because it's the first (and only) parameter.

## Playlists

The `list=` parameter contains the ID of the playlist you're watching the video
from, if any. Otherwise, the parameter is omitted. Here's how that looks:

- https://www.youtube.com/watch?v=47dtFZ8CFo8&list=PLwxnUUM01nt2nMh9DPq09e6fIDbumybgt
- https://youtu.be/47dtFZ8CFo8?list=PLwxnUUM01nt2nMh9DPq09e6fIDbumybgt

There, the playlist ID was `PLwxnUUM01nt2nMh9DPq09e6fIDbumybgt`. You can link to
the playlist itself with a format like:

```text
https://youtube.com/playlist?list=[playlist_id]
```

For example, the direct link to the playlist in the two example links I used is:

- https://youtube.com/playlist?list=PLwxnUUM01nt2nMh9DPq09e6fIDbumybgt

As far as I know, it's not possible to link to a playlist using `youtu.be`.

## Further reading

[This Stack Exchange answer](https://webapps.stackexchange.com/a/9881) is a good
reference for some other YouTube parameters.

[^hugo-shortcode]: I use a static site generator called
  [Hugo](https://gohugo.io) for my website. It has a built in "shortcode" which
  is a feature that allows me to embed certain code blocks into a page. One of
  its shortcodes, named `youtube`, allows me to embed a YouTube video into my
  post. You can read more info about [shortcodes on the Hugo
  docs](https://gohugo.io/content-management/shortcodes/#use-hugos-built-in-shortcodes)
