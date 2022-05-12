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

  - name: double-sex
    src: double-sex.webp
    title: Resulting image after typing `s/e/x` a second time.

  - name: chess
    src: chess.webp
    title: This happens once you type `s/w/ag` after having done `s/e/x`.

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

For whatever reason, Discord decided to implement this into both their
web/desktop client and their iOS app. Note that while real `sed` commands can
get much more complicated, Discord's implementation doesn't support those
advanced features[^trailing-slash-note].

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
your user agent set to anything containing `Discord` (case-insensitive), then it
serves the image directly.

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

## Extra features

I'll update this section if I find out about any new features worth mentioning
in the future.
