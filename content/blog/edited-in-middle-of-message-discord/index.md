---

title: Put `(edited)` in the middle of a message in Discord
date: 2021-03-25T18:48:34-05:00
toc: true
comments: true

authors:
  - bbaovanc

aliases:
  - posts/edited-in-middle-of-message-discord/

tags:
  - tutorial
  - discord
  - discord-tricks

resources:
  - name: feature
    src: example.webp
    title: Example image

---

With a bit of trickery using the RLE character (U+202B), you can get the
`(edited)` text on a message to be somewhere other than at the end of the
message.

<!--more-->

## Tutorial

Before you start, copy the "right-to-left embedding" character
([U+202B](https://unicode-explorer.com/c/202B)) to your clipboard.

### Method 1

This method allows you to create a placeholder message, and then replace it with
a new message with the `(edited)` text inside it all at once.

1. Send a message with some random text since you have to edit an existing
   message for the trick to work.
2. Start editing the message you just created and delete all the text inside
3. Type the text you want on the left of `(edited)`.
4. Type a space, then paste the character twice, and type another space.
5. Type the text you want on the right of `(edited)`.
6. Save the message.

You can also start at step 3 instead, send the message, and then edit the
message afterwards to add the `(edited)` text.

### Method 2

This method allows you to add `(edited)` to the end of an existing message, and
then add even more text to the right of that.

1. Send a message containing the text you want on the left of `(edited)`.
2. Start editing the message you just created
3. At the end of the message, type a space, then paste the character twice, and
   type another space.
4. Type the text you want on the right of `(edited)`.
5. Save the message.

*This post was adapted from [bbaovanc/discord-tricks][1]*

[1]: https://git.bbaovanc.com/bbaovanc/discord-tricks
