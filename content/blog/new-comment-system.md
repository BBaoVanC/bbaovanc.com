+++
title = "New Comment System"
date = "2021-04-11"
aliases = [
  "posts/new-comment-system/",
]

description = """
I added a comment system to my blog, using [Isso](https://posativ.org/isso/).
"""

tags = [
  "announcement",
  "hugo",
  "blog",
]
+++

## About

I set up a comment system named [Isso](https://posativ.org/isso/) on my blog
today. At the bottom of each blog post, there's a comment section. You don't
need to sign up with an account or sign in with Google, Facebook, none of that
junk. You can comment anonymously, or provide any of the following three fields:
name, email address, and website, which will be shown to other people viewing
your comment. I'm going off of the assumption that no one cares/is malicious
enough to spam my comment sections.

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