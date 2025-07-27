---

title: Experimenting with GitHub Copilot
date: 2021-11-06T23:56:47-05:00
lastmod: 2021-11-08T21:46:39-06:00
toc: true
comments: true

authors:
  - bbaovanc

categories:
  - experiments

tags:
  - github-copilot
  - programming

series:
  - github-copilot-experiments

resources:
  - name: feature
    src: boba-shop.webp
    title: GitHub Copilot tends to repeat stuff.

  - src: rust-poem.webp

  - src: python-twinkle-poem.webp

  - src: horrible-code.webp

  - src: dropdown-css.webp

  - src: boba-shop-size.webp

  - src: boba-shop-color.webp

  - src: girlfriend.webp

  - src: cheese-burger-poem.webp

  - src: sing.webp

  - src: what-is-boba.webp

  - src: what-is-github-copilot.webp

  - src: what-is-the-purpose-of-this-file.webp

  - src: who-is-steve-jobs.webp

---

I decided to play around with GitHub Copilot. Here's some of the code that I
got as a result.

<!--more-->

## Poems

First, I tried to get Copilot to write me a poem in Rust. It didn't really work.

{{< figure src="rust-poem.webp" />}}

So, I tried Python instead.

{{< figure src="python-twinkle-poem.webp" />}}

This is where I realized that Copilot was doing a little more than just
repeating code it had seen before verbatim.

Before this testing, my understanding was that Copilot was sort of like a search
engine. It looked at the context and found a piece of code from GitHub that
matched the functionality you wanted. This was the reason I had such a negative
opinion about it. I saw it as a way to easily violate copyleft licenses such as
GPLv3.

Anyways, back to more testing.

## Horrible code

I decided to ask it to generate some horrible code for me. Unfortunately, it
didn't quite do what I wanted.

{{< figure src="horrible-code.webp" />}}

## Solving problems in bobatheme

I decided to consult Copilot on how to make a nice CSS dropdown, which I need
for the language picker in bobatheme.

{{< figure src="dropdown-css.webp" />}}

Maybe I'll have to test it out.

## Making a boba shop

Now, I asked Copilot for help on creating a new
[boba](https://en.wikipedia.org/wiki/Bubble_tea) shop, which got a little
spammy.

{{< figure src="boba-shop.webp" />}}

{{< figure src="boba-shop-size.webp" />}}

## More random code

I got some ideas of important questions to ask Copilot thanks to the
conversations going on in Discord.

{{< figure src="girlfriend.webp" />}}

Turns out the API endpoint in that code is real, and returns a (presumably)
nonexistent person.

## Another poem

I decided to generate one more poem, this time naming the function something
different in hopes of getting a different result.

{{< figure src="cheese-burger-poem.webp" />}}

It was a success! And the output of the program:

```text
Mary had a little lamb.
Its fleece was white as snow.
And everywhere that Mary went.
..........
Cheese Burger
```

## A song

I decided to try and get it to sing a song.

{{< figure src="sing.webp" />}}

According to Google Translate, here's what that says:

```python
def sing():
    print("""
    You are my little pig
    I love you
    You are my little pig
    I love you
    """)
```

## GitHub Copilot as an encyclopedia

I decided to ask Copilot a few random questions to test its encyclopedia
abilities.

{{< figure src="what-is-boba.webp" />}}

{{< figure src="what-is-github-copilot.webp" />}}

{{< figure src="who-is-steve-jobs.webp" />}}

I had run out of questions to ask, so I just started the comment with a generic
"what is" and let Copilot finish the question and answer.

{{< figure src="what-is-the-purpose-of-this-file.webp" />}}

That last line came out of nowhere!
