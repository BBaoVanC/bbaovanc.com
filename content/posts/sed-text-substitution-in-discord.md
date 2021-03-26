+++
title = "Text Substitution in Discord using `sed`"
date = "2021-03-25T18:48:15-05:00"
author = "bbaovanc"
tags = ["discord", "discord-tricks"]
keywords = ["discord", "sed", "text", "replacement"]

description = """
Discord has (very primitive) support for text replacement using `sed` syntax.
"""

showFullContent = false
+++

## How-to

[Example Video](/blog/media/discord-tricks/sed-text-replacement.mov)

If you send a message using `sed` substitution format (`s/old text/new text`),
Discord will execute it on the message you've last sent.

## Caveats

- Regex is not supported
- Global substitution is not supported

*This post was adapted from [gitea:bbaovanc/discord-tricks][1]*

[1]: https://git.bbaovanc.com/bbaovanc/discord-tricks
