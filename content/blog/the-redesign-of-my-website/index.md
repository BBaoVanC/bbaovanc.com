---

title: The redesign of my website
date: 2021-10-18T14:03:05-05:00
lastmod: 2021-10-27T09:51:43-05:00
toc: true
comments: true

authors:
  - bbaovanc

categories:
  - meta

tags:
  - bobatheme
  - hugo
  - web-development

resources:
  - name: feature
    src: bobatheme.webp
    title: Homepage on bbaovanc.com, using bobatheme.

  - name: actions-comment
    src: github-actions-deploy-comment.webp
    title: Comment from GitHub Actions that links to the pull request preview.

  - name: deployment
    src: pull-request-deployment.webp
    title: GitHub deployments are created for the previews as well.

---

For the past three weeks I've been designing and perfecting a new theme for my
website with the goal of keeping it simple but not ugly.

<!--more-->

## A total redesign

I've switched to a new theme. Visually, it's similar to
[hugo-bearblog](https://github.com/janraasch/hugo-bearblog) which was the theme
I had previously. Bearblog does a great job for being simple and very light, but
it's not featureful enough for me. bobatheme has a lot of fancy features thanks
to Hugo. For example: list pages (such as [/blog/]({{< ref "/blog/" >}})) have
previews for each article, including featured images or videos for select
articles. You can also link to specific headers in an article, and articles have
metadata such as word count, reading time, and the git commit that last modified
them. My favorite new feature, however, is that bobatheme has icons.

### Icons

I'm using an icon pack called [Feather](https://feathericons.com/). Using Hugo,
I have a template that just takes the contents of the SVG file and inserts it
directly into the HTML source code. While that increases the size of the HTML
file, it minimizes the amount of requests that your browser has to make, and in
a lot of cases, it will reduce the total amount of data you have to download
thanks to compression.

### No JavaScript (yet)

There isn't any JavaScript yet, but in the future I'll use a little to add small
features such as copying code blocks to the clipboard.

## My website is on GitHub

My website's source code was previously on git.bbaovanc.com, but I migrated it
to [a new repository on GitHub](https://github.com/BBaoVanC/bbaovanc.com) so I
could use Netlify/GitHub Actions to automatically build website previews for
pull requests.

### Automatic Pull Request Previews

Every pull request has its own preview built for it using GitHub Actions, which
is linked in a comment, and shown as a deployment on the pull request.

{{< figure src="actions-comment" >}}

{{< figure src="deployment" >}}

## Translations

I'm working on translating all pages on my site to Spanish. If you know Spanish,
or any other languages, I'd appreciate if you could help out by reviewing
existing translations, or submitting new ones. See the [contributing
guidelines](https://github.com/BBaoVanC/bbaovanc.com/blob/master/CONTRIBUTING.md#translations)
for more information).

### Tracking Status

I'm currently tracking translation status using [GitHub
projects](https://github.com/BBaoVanC/bbaovanc.com/projects). There's a
[Translation Pull Requests](https://github.com/BBaoVanC/bbaovanc.com/projects/1)
project which tracks the review status of translation pull requests in all
languages. If you want to look at pull requests for a specific language, you can
filter by the label (for example: Spanish is `translate-es`).

### Contribute translations

If you speak any other languages (especially Spanish), then I'd really
appreciate it if you could review any [open translation-related pull
requests](https://github.com/BBaoVanC/bbaovanc.com/pulls?q=is%3Apr+is%3Aopen+label%3Atranslation-needs-review).
If you have some free time, I'd also appreciate it even more if you could create
some new translations into other languages, or write translations for pages that
aren't already translated.

Just remember to read the [contribution
guidelines](https://github.com/BBaoVanC/bbaovanc.com/blob/master/CONTRIBUTING.md#translations)
before contributing as I have some important information such as how to format
pull requests and how to build the site yourself instead of having to wait for
Netlify. You can also look at any existing translation related pull requests as
an example.
