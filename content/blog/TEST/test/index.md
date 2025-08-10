---

title: Test
date: 2022-04-23T17:50:35-05:00
lastmod: 2022-04-23T17:50:35-05:00
toc: true
comments: true
draft: true

authors:
  - bbaovanc

tags:
  - awesome

series:
  - Archetype

# this will be shown for the article in list pages and in the page metadata
# it can be either an image or video (this might change in the future, however)
resources:
  - name: feature
    src: something.webp
    title: Some image (image format can be anything; webp is just an example)

---

This page is about something. All the content before the "more" HTML comment
below will become the summary, which will be used in list pages and in the meta
tags on the article.

Or, if you don't want your description to be at the top of the article, you can
set your own `description` in the front matter and it will override this. See
the [Content Summaries](https://gohugo.io/content-management/summaries/) page on
the Hugo docs for more information.

<!--more-->

## Stuff

| apple         | banana         | cherry        |
|---------------|----------------|---------------|
| four word     | five word      | six word      |
| seven word    | eight word     | nine word     |
| ten word      | eleven word    | twelve word   |
| thirteen word | fourteen word  | fifteen word  |
| sixteen word  | seventeen word | eighteen word |
{.simple .stuff}

## Formatting

**bold** *italic* `monospace` ***boldtalic***

## Code

```console
$ hello-world hello "test" 'mo''re' "st\"u"f\\f $(ls)
hello world!
# superuser command
with some output
```

```
no language here!
```

```console
$ weird-command "$(ls /)" --with-flag -abcdefg
hello world!
```

```html
<div class="hello">
  <span class="world">blah</span>
  <hr>
  <p>foo bar</p>
</div>
```

```console
# command-with-lots-of-lines
blajoa ijf e faew afe
jw
 ajef ajweiofoihaewfoohifaewohip haewif
 awe ihulwlimuhfemiuhimuhfaewhuimaewf
aiuylwef7yt78t78t87mny87mny87myn
(*$YMYJ<(H@W<OH*&(HO<X*@WZH*<U@XH<*(XOH@(*
```

## Something

All the content below the "more" HTML comment above is part of the article
itself.

## Asides

{{< aside note >}}
Note: something something something
{{< /aside >}}

{{< aside info >}}
Info: something something something
{{< /aside >}}

{{< aside tip >}}
Tip: something something something
{{< /aside >}}

{{< aside warning >}}
Warning: something something something
{{< /aside >}}

{{< aside example >}}
Example: something something something
{{< /aside >}}

{{< aside quote >}}
> here is a quick little markdown quote
>
> someone said something somewhere somehow
>
> words words words and even more words[^1]
>
> more
>
> more
>
> more
>
> more
>
> more
>
> more
>
> more

[^1]: https://example.com

Said by some guy
{{< /aside >}}

# h1

## h2

### h3

#### h4

##### h5

###### h6
