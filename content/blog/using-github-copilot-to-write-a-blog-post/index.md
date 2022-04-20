---

title: Using Github Copilot to write a blog post
date: 2021-11-07T16:17:15-06:00
lastmod: 2021-11-08T21:46:39-06:00
toc: true
comments: true

authors:
  - bbaovanc

tags:
  - github-copilot
  - blog

series:
  - github-copilot-experiments

# this will be shown for the article in list pages and in the page metadata
# it can be either an image or video (this might change in the future, however)
resources:
  - name: feature
    src: copilot-blog-post.webp
    title: GitHub Copilot helps me write a blog post.

  - name: print-a-news-article
    src: print-a-news-article.webp

---

I found out that GitHub Copilot can write in Markdown, so I decided to get it to
write a blog post for me. Here's how I did it.

<!--more-->

## Preface

I recommend you read my [other blog post about Copilot]({{< ref
"/blog/github-copilot-experiments/index.md" >}}) where I showed a bunch of
examples of code I generated using Copilot. Near the end of it, I started to
experiment asking some questions to it, rather than using it to generate code.
That turned out to be a great idea, and led to the creation of this blog post.

## Writing English with Copilot

After using Copilot as an encyclopedia, I got an idea. What if I used GitHub
Copilot to generate ideas?

{{< figure src="print-a-news-article" >}}

I decided to take it a step further and set the language to Markdown. I started
writing out the basic structure of a blog post on my website and let it
autocomplete.

{{< figure src="feature" >}}

I'm not quite sure who Kurt A. Smith is, why Copilot chose April Fools 2020 for
the date, or why it was so adamant on writing a blog post about itself. What I
do know is that I would be able to write a blog post. All I had to do was type a
word or two, and Copilot turned it into a couple sentences.

## The finished product

The actual blog post written by Copilot is available [here]({{< ref "../copilot-post/" >}}).
