---

title: Text substitution in Discord using `sed`
date: 2021-03-25T18:48:15-05:00
toc: false
comments: true

authors:
  - bbaovanc

aliases:
  - /blog/posts/sed-text-substitution-in-discord/
  - /blog/posts/text-substitution-in-discord-using-sed/

categories:
  - tips-and-tricks

tags:
  - discord
  - discord-tricks
  - sed

resources:
  - name: feature
    src: example.mov
    title: Example Video

---

Discord has (very primitive) support for text replacement using `sed` syntax.

<!--more-->

## Tutorial

If you send a message using `sed` substitution format (`s/old text/new text`),
Discord will execute it on the message you've last sent.

## Caveats

- Regex is not supported
- Global substitution is not supported

*This post was adapted from [gitea:bbaovanc/discord-tricks][1]*

[1]: https://git.bbaovanc.com/bbaovanc/discord-tricks
