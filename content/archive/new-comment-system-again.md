+++
title = "New Comment System (again)"
date = "2021-04-17"
toc = true

aliases = [
  "posts/new-comment-system-again/",
]

description = """
I decided to switch my comment system from Isso to
[Commento](https://www.commento.io/)
"""

#tags = [
#  "announcement",
#  "hugo",
#  "blog",
#]
+++

## Isso vs Commento

I know it's only been six days since I added Isso, but I decided to switch to a
better comment system. Isso is meant to be simple, which means that it's missing
a lot of features. Commento has a lot of features such as sticky (pinned)
comments, spam detection, thread locking, email notifications (I couldn't get
this working on Isso), and a nicer design. I also was able to write some
[custom CSS rules][1] which make it look alright on my blog's theme. It also
supports SSO, so I might add support for signing up with GitHub, and possibly
GitLab.

## Summary of the [first post](new-comment-system)

If you haven't read the
[New Comment System](new-comment-system) post, here's the
most important information. There's a comment section at the bottom of each post
where you can view and post comments. You can post anonymously, or create an
account so you can show your username and get email notifications. You can also
upvote, downvote, and reply to other comments.

[1]: https://git.bbaovanc.com/bbaovanc.com/blog/src/commit/478e15218313a33216d361de387b3bd878cd0ba6/assets/css/comments.css
