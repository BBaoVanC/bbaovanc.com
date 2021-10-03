+++
title = "Text Substitution in Discord using `sed`"
date = "2021-03-25"
toc = true

aliases = [
  "/blog/posts/sed-text-substitution-in-discord/",
  "/blog/posts/text-substitution-in-discord-using-sed/",
]

description = """
Discord has (very primitive) support for text replacement using `sed` syntax.
"""

tags = [
  "tutorial",
  "discord",
  "discord-tricks",
]
+++

## Tutorial

[Example Video](example.mov)

If you send a message using `sed` substitution format (`s/old text/new text`),
Discord will execute it on the message you've last sent.

## Caveats

- Regex is not supported
- Global substitution is not supported

*This post was adapted from [gitea:bbaovanc/discord-tricks][1]*

[1]: https://git.bbaovanc.com/bbaovanc/discord-tricks
