---

title: How to put `(edited)` in the middle of a message in Discord
date: 2021-03-25T18:48:34-05:00
lastmod: 2022-04-08T23:29:41-05:00
toc: true
comments: true

authors:
  - bbaovanc

aliases:
  - posts/edited-in-middle-of-message-discord/

categories:
  - guides
  - tips-and-tricks

tags:
  - discord
  - discord-tricks

resources:
  - name: feature
    src: example.webp
    title: Example image

---

You might have seen a trick on Discord where the little `(edited)` caption
appears in the middle of a message instead of at the end. With a small hack
involving the [right-to-left embedding character
(U+202B)](https://unicode-explorer.com/c/202B), the `(edited)` text can be moved
to any location inside the message.

<!--more-->

## Tutorial

Before you start, copy the "right-to-left embedding" character
([U+202B](https://unicode-explorer.com/c/202B)) to your clipboard.

### Method 1

With this method you write a placeholder message, and then replace it completely
with a new message containing the `(edited)` text inside it all at once.

1. Send a message with some random text (this text will be replaced entirely)
2. Start editing the message you just created and delete all the text inside
3. Type the text you want on the left of `(edited)`.
4. Type a space, then paste the character twice, and type another space.
5. Type the text you want on the right of `(edited)`.
6. Save the message.

You can also start at step 3 instead, send the message, and then perform any
edit on the message afterwards to add the `(edited)` text.

### Method 2

This method works by adding `(edited)` to the end of an existing message, and
then extra text to the right.

1. Send a message containing the text you want on the left of `(edited)`.
2. Start editing the message you just created
3. At the end of the message, type a space, then paste the character twice, and
   type another space.
4. Type the text you want on the right of `(edited)`.
5. Save the message.

*This post was adapted from [bbaovanc/discord-tricks][1]*

[1]: https://git.bbaovanc.com/bbaovanc/discord-tricks
