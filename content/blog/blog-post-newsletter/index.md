---

title: Newsletter for my blog posts
date: 2022-04-30T01:00:14-05:00
lastmod: 2022-04-30T01:00:14-05:00
toc: true
comments: true

authors:
  - bbaovanc

tags:
  - meta
  - newsletter

# this will be shown for the article in list pages and in the page metadata
# it can be either an image or video (this might change in the future, however)
resources:
  - name: feature
    src: listmonk-bobatheme-template.webp
    title: My custom newsletter template based on my website's custom theme.

  - name: listmonk-splash
    src: listmonk-splash.webp
    title: >-
      Dashboard on listmonk ---
      [source](https://listmonk.app/static/images/splash.png)

---

I created a newsletter for blog posts on my website so you can sign up for email
notifications when I post new ones, so I have more than just an RSS feed.

<!--more-->

**See the ["Signing Up" section]({{< ref "#signing-up" >}}) for instructions on
how to sign up for the newsletter.**

## Choosing the right mailing list manager

For my newsletter manager, I chose [listmonk](https://listmonk.app/). As I was
searching for self-hosted newsletter managers, it caught my eye because of how
modern and beautiful its interface looks. In fact, it was the only self-hosted
newsletter/mailing list manager I looked at that doesn't have an overall old and
ugly interface. Additionally, it has a live demo, so I was able to test it out
and see if it would be able to meet my (relatively low) requirements.

{{< figure src="listmonk-splash" >}}

I also tried out [GNU Mailman 3](https://www.list.org/) about a year ago.
However, I could not get it to integrate cleanly with my email
server[^mailman-mailcow]. listmonk can operate over SMTP, just like any other
program that sends mail. That makes the setup much less complicated, and I was
also able to set up the [official Docker
image](https://listmonk.app/docs/installation/#docker) using Docker Compose
setup just like the other programs I use.

If you're interested, the Docker Compose configuration files I ended up writing
are available at [configs/listmonk on my Gitea
instance](https://git.bbaovanc.com/configs/listmonk).

## Newsletter formatting

I ended up writing my own template for listmonk from scratch, based on the CSS
used in [bobatheme](https://github.com/BBaoVanC/bobatheme), the theme that my
website uses. Here's a screenshot of how it currently looks:

{{< figure src="feature" >}}

## Signing up

You can sign up to get emails about new posts on the [newsletter signup form
here](https://lists.bbaovanc.com/subscription/form). Make sure the box next to
the list labeled `bbaovanc.com Blog Posts` is checked. You'll need to provide an
email address, and optionally a nickname (or your real name if you want).

Right now there's only one list with public signup enabled, but that may change
if you're reading this in the future. In that case, you can sign up for as many
or as few lists as you want.



[^mailman-mailcow]: Mailman requires access to the mail server over
  [LMTP](https://en.wikipedia.org/wiki/Local_Mail_Transfer_Protocol). However,
  giving it access to my mail server over LMTP is not very easy because of the
  setup that [Mailcow](https://mailcow.email) (my email server) uses. There *is*
  an existing project called
  [dockerized-mailcow-mailman](https://github.com/g4rf/dockerized-mailcow-mailman),
  but it uses the Apache web server to serve the frontend. I'm not familiar with
  Apache, and also I don't really want to complicate my Mailcow setup switching
  to an almost completely different setup just for one little program.
