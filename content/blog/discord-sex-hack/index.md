---

title: How the "Discord sex" (`s/e/x`) hack works
date: 2022-05-11T21:11:17-05:00
lastmod: 2022-05-11T21:11:17-05:00
toc: true
comments: true

authors:
  - bbaovanc

categories:
  - tips-and-tricks

tags:
  - discord
  - discord-tricks
  - sed

# this will be shown for the article in list pages and in the page metadata
# it can be either an image or video (this might change in the future, however)
resources:
  - name: feature
    src: example.webp
    title: Result after sending a GIF and then sending `s/e/x`.

  - name: default-sex
    src: default-sex.webp
    title: Fallback image on `txnor.com`

  - name: double-sex
    src: double-sex.webp
    title: Resulting image after typing `s/e/x` a second time.

  - name: chess
    src: chess.webp
    title: This happens once you type `s/w/ag` after having done `s/e/x`.

  - name: sword
    src: sword.webp
    title: This happens when you type `s/w/ord` after having done `s/e/x`.
  - name: sword-atk
    src: sword-atk.webp
    title: This happens when you type `s/d/dATK`
  - name: sword-def
    src: sword-def.webp
    title: This happens when you type `s/d/dDEF`
  - name: sword-hug
    src: sword-hug.webp
    title: This happens when you type `s/d/dHUG`
  - name: sword-win
    src: sword-win.webp
    title: Win screen on the `s/w/ord` game.
  - name: sword-lose
    src: sword-lose.webp
    title: Lose screen on the `s/w/ord` game.

  - name: 6969th
    src: 6969th.webp
    title: This happens on average (since it's randomized) every 6070th use.

  - name: math-challenge
    src: math-challenge.webp
    title: Math challenge example

---

There's this trick going around on Discord recently where if you send any GIF
from Tenor, and then type `s/e/x`, then it turns it into a different meme GIF.
Here's how it works.

<!--more-->

## The `sed` syntax

For operating systems based on Unix or Linux, there's usually a simple terminal
command included called [`sed`][sed-wikipedia], which is most commonly used to
run text replacement commands. Here's a very simple example of what a basic
`sed` command looks like:

[sed-wikipedia]: https://en.wikipedia.org/wiki/Sed

```console
$ sed 's/hello/goodbye/'
```

Discord likely implemented this in order to appeal to
[IRC][irc-wikipedia][^irc-definition] users. Since IRC doesn't support editing
messages, it's common for people to send messages in that format to tell people
about changes to their previous message. Discord implemented this into both
their web/desktop client and their iOS app, excluding the Android app.

[irc-wikipedia]: https://en.wikipedia.org/wiki/Internet_Relay_Chat

[^irc-definition]: IRC (Internet Relay Chat) is a simple text-based chat system.
  It's a very old protocol, however its simplicity and minimalism is the main
  reason people choose it. It's not very popular anymore.

Note that while real `sed` commands can get much more complicated, Discord's
implementation doesn't support those advanced features[^trailing-slash-note].

[^trailing-slash-note]: Also note that in Discord's implementation, the trailing
  slash (after `goodbye`) can be ommitted (making it just `s/hello/goodbye`),
  but with the real `sed` command, it's required.

{{< see-also "/blog/text-substitution-in-discord-using-sed" >}}

## What does `s/e/x` do?

When you send a GIF using the GIF picker on Discord, it actually sends the link
to the GIF, which is served by [Tenor][tenor-website]. For example, here's a GIF
sent from Tenor:

[tenor-website]: https://tenor.com

https://tenor.com/view/cat-massage-gif-24282757

Running `s/e/x` will take the first occurrence of `e` and replace it with `x`.
The link becomes the following (notice the bolded letter `x`):

[https://t**x**nor.com/view/cat-massage-gif-24282757][example-1]

[example-1]: https://txnor.com/view/cat-massage-gif-24282757

Then, all that's left to do is to buy the domain `txnor.com`, and write a simple
program to run on it. In fact, it looks like that domain was purchased purely in
order to make this trick possible[^txnor-domain-date].

[^txnor-domain-date]: According to [a quick WHOIS lookup][txnor-whois], the
  domain was registered on May 3, 2022. That's the same day that [@Rebane tweeted
  about the new feature][rebane-tweet] (going to https://txnor.com redirects to
  this tweet), so I assume that this is the only reason they bought the domain.

[txnor-whois]: https://www.whois.com/whois/txnor.com
[rebane-tweet]: https://twitter.com/rebane2001/status/1521544722875142145

## How does it display on Discord without redirecting?

When viewing any of the URLs on `txnor.com` in a normal web browser, you get
[redirected to a tweet][rebane-tweet]. However, Discord is able to display the
image without being redirected.

When Discord loads a website to generate an embed, it uses a user
agent[^user-agent-definition] (which is a little piece of text which tells the
server what your browser is) which looks something like this:

[^user-agent-definition]: If you actually care, there's a [Wikipedia
  article](https://en.wikipedia.org/wiki/User_agent), and a [page on
  WhatIsMyIPAddress.com](https://whatismyipaddress.com/user-agent) which also
  explain what a user agent is.

```text
User-Agent: Mozilla/5.0 (compatible; Discordbot/2.0; +https://discordapp.com/)
```

The important part here is the word `Discord`. If you visit the website with
your user agent set to anything containing `Discord`
(case-insensitive)[^discord-user-agent], then it serves the image directly.

[^discord-user-agent]: [According to the source code][user-agent-source-code],
  it looks like `Intel Mac OS X 11.6; rv:92.0` also triggers the same response.

[user-agent-source-code]: https://github.com/rebane2001/txnor-server/blob/26c7c279b0b4668c8a3b061692d83c507aeac7c5/txnor.nginx#L23-L27

## Default image

If you go to any URL on `txnor.com` that doesn't fit one of the existing
patterns/games, then it returns this fallback image:

{{< figure src="default-sex" >}}

## Extra features

### Double sex

If you then run `s/e/x` a second time, then it changes to a different image:

{{< figure src="double-sex" >}}

This works in a simple way as well. The next `e` that appears in the URL is
inside `/view/`. So, after typing `s/e/x` a second time, the URL becomes:

[https://txnor.com/vi**x**w/cat-massage-gif-24282757][example-2]

[example-2]: https://txnor.com/vixw/cat-massage-gif-24282757

### Chess (`s/w/ag`)

Another cool feature is that you can play chess by typing `s/w/ag` after typing
the initial message of `s/e/x`.

{{< figure src="chess" >}}

### `s/w/ord`

If you do `s/w/ord` after `s/e/x`, then it starts a fighting game (titled
"Wumpagotchi Adventures". You can use three commands: s/d/d**ATK**,
s/d/d**DEF**, and s/d/d**HUG**.

Here are a few example images:

#### Main `s/w/ord` screen

{{< figure src="sword" >}}

#### ATK command

{{< figure src="sword-atk" >}}

#### DEF command

{{< figure src="sword-def" >}}

#### HUG command

{{< figure src="sword-hug" >}}

#### Win screen

{{< figure src="sword-win" >}}

#### Lose screen

{{< figure src="sword-lose" >}}

### 6969th Discord Sexer

If you happen to get a one in 6970 chance, it will instead return
a special image:

{{< figure src="6969th" >}}

[6969th-source]: https://github.com/rebane2001/txnor-server/blob/26c7c279b0b4668c8a3b061692d83c507aeac7c5/sex.py#L130-L133

Here's a [snippet of the code that handles this chance][6969th-source]:

```python
# 6969th winner image (disable for chess)
if random.randint(0, 6969) == 6969 and "ag" not in name:
    web.header('Cache-Control', 'no-store')
    return six_nine
```

I believe it's supposed to be a 1/6969 chance, but `random.randint` in Python
[includes both numbers][randint-inclusive]. That means that the possible numbers that it could pick
would be 0, 1, ... 6968, 6969. If you were to count the numbers included in that
sequence, it would total 6970.

[randint-inclusive]: https://docs.python.org/3/library/random.html#random.randint

### Math challenge

Any URL that matches [this regular expression][math-challenge-regex] will
instead return a randomized math challenge:

[math-challenge-regex]: https://regex101.com/r/ddEkML/1

{{< figure src="math-challenge" >}}

What's special is that the math challenge is [set to not be
cached][math-challenge-caching].

[math-challenge-caching]: https://github.com/rebane2001/txnor-server/blob/26c7c279b0b4668c8a3b061692d83c507aeac7c5/sex.py#L137

How it works is that when each person's Discord client sends a request to the
Discord CDN to get the image, the client caches that image. That means each
client will see the same challenge problem, even if the user restarts the
client. But separate clients will not have it cached, so they'll request it
again themselves, and different numbers will be generated.

## Discord sex is open source

Thanks to a [comment from Rebane on this post](#isso-16), I now know that the
server running on `txnor.com` is open source. See
[rebane2001/txnor-server][txnor-server-github].

[txnor-server-github]: https://github.com/rebane2001/txnor-server

## YouTube video

Rebane also [made a YouTube video][txnor-youtube-video] about this trick. Make
sure to check it out too!

[txnor-youtube-video]: https://www.youtube.com/watch?v=km8CR-fdB7o
