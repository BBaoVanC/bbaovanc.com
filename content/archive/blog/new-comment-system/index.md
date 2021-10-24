---

title: New Comment System
date: 2021-04-11
toc: true
comments: false

aliases:
  - /blog/posts/new-comment-system/
  - /blog/new-comment-system/
  - /archive/new-comment-system/

tags:
  - announcement
  - hugo
  - blog

---

I added a comment system to my blog, using [Isso](https://posativ.org/isso/).

<!--more-->

## About

I set up a comment system named [Isso](https://posativ.org/isso/) on my blog
today. At the bottom of each blog post, there's a comment section.  You can
comment anonymously, or provide any of the following three fields: name, email
address, and website, which will be shown to other people viewing your comment.
I'm not currently concerned about abuse (such as spam) in the comment section
since my website is so small.

## Known Issues

### Editing and deleting not working

You're supposed to be able to edit and delete comments up to 15 minutes after
posting them. As of now, that doesn't seem to be working; the request just
returns 403 (forbidden).

### White text on white background when previewing comment

This is a CSS related issue. This was also happening when editing/writing a
comment, but I edited it so the edit box has black text. I think a better fix is
to make the new comment form have a dark background, but I'll deal with that
later.
