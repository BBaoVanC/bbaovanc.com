+++
title = "Put (edited) in the middle of a message in Discord"
date = "2021-03-25T18:48:34-05:00"
author = "bbaovanc"
cover = "media/discord-tricks/edited-in-middle-of-message.png"
tags = ["discord", "discord-tricks"]
keywords = ["discord", "edited"]
description = "With a bit of trickery using the RLE character (U+202B), you can get the (edited) text on a message to be somewhere other than at the end of the message."
showFullContent = false
+++

## Tutorial

1. Copy the "right-to-left embedding" character (U+202A) to your clipboard.
2. Open editing box of a message
3. Delete all text inside
4. Paste the character
5. Type the text you want on the right of `(edited)`
6. Press space and paste the character
7. Type the text you want on the left of `(edited)`

*This post was adapted from [gitea:bbaovanc/discord-tricks](https://git.bbaovanc.com/bbaovanc/discord-tricks)*
