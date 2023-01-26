---

title: Using GitHub Actions to audit my website with Google Chrome Lighthouse
date: 2022-05-07T00:54:11-05:00
lastmod: 2022-05-08T16:16:02-05:00
toc: true
comments: true

authors:
  - bbaovanc

categories:
  - devops
  - meta

tags:
  - caddy
  - github-actions
  - google-lighthouse

# this will be shown for the article in list pages and in the page metadata
# it can be either an image or video (this might change in the future, however)
resources:
  - name: feature
    src: dashboard-performance-graph.webp
    title: Picture of the `Performance` section on the Lighthouse CI dashboard

  - name: youtube-embed-performance-comparison
    src: youtube-embed-performance-comparison.webp
    title: >-
      Performance hit caused by adding a YouTube embed. You can see the
      comparison itself [on this comparison
      page](https://lhci.bbaovanc.com/app/projects/bbaovanc.com/compare/01d2064b6fac?baseUrl=https%3A%2F%2Flocalhost%2Fblog%2Fthe-redesign-of-my-website%2F&compareUrl=https%3A%2F%2Flocalhost%2Fblog%2Fyoutube-url-structures-you-should-know%2F&baseBuild=01d2064b-6fac-40df-b4e6-373037ae1f9e).

---

The other day I set up automatic testing of my website using [Google Chrome
Lighthouse][google-lighthouse]. I'm also running my own Lighthouse CI server to
store test result history and show trends. Here's an outline of what this means,
some of the results I've obtained so far, and my thoughts on the usefulness of
Lighthouse.

[google-lighthouse]: https://developers.google.com/web/tools/lighthouse

<!--more-->

## What is Lighthouse?

Lighthouse is a tool developed by Google which audits websites and gives them a
score in four categories: *Performance*, *Accessibility*, *Best Practices*, and
*SEO (search engine optimization)*. It's also built into the developer console
in Chrome, so you can run it manually on any website you want directly inside
your browser.

I have already been using Lighthouse manually to do occasional tests on my
website and its theme, [bobatheme][bobatheme]. However, I recently came across
[this GitHub Action][lhci-action]. It caught my eye because I was [already using
GitHub Actions][old-audit-workflow] to perform a few basic Hugo[^hugo]-related
audits found [in a thread on the Hugo forum][hugo-audits-thread].

[^hugo]: [Hugo](https://gohugo.io) is the framework that my website is built on. It's
  a static site generator which generates my site according to my own custom
  templates that make up my theme.

[bobatheme]: https://github.com/BBaoVanC/bobatheme
[lhci-action]: https://github.com/marketplace/actions/lighthouse-ci-action
[old-audit-workflow]: https://github.com/BBaoVanC/bbaovanc.com/blob/31e25c2578a789afe71ce90352747eb427ca3c0e/.github/workflows/audit.yml#L31-L59
[hugo-audits-thread]: https://discourse.gohugo.io/t/audit-your-published-site-for-problems/35184

## Setting it all up

My goal is to run Lighthouse's audits on an environment as similar to my real
website's deployment as possible.

First, I [created a separate `lighthouse` job on my audit
workflow][lighthouse-actions-job] on GitHub Actions. This job will do all of the
testing. Since it's a separate job, it runs in parallel with my existing audit
task.

[lighthouse-actions-job]: https://github.com/BBaoVanC/bbaovanc.com/blob/3668b6cfb11d09149b5da347219cdc75d0ce0985/.github/workflows/audit.yml#L7

Next, I copied [my existing build steps verbatim][production-build-steps]. This
makes the site effectively identical to my real deployment on bbaovanc.com. One
of the crucial steps is to pre-compress all the files so their compressed
versions can be served without the server having to compress them on-the-fly,
saving valuable processing power.

[production-build-steps]: https://github.com/BBaoVanC/bbaovanc.com/blob/db65e9fc23b840429f5c9ad2b43d7dd01a024f36/.github/workflows/deploy.yml#L22-L33

Serving the compressed files is crucial because it simulates the real world
transfer size of the files. In addition, Lighthouse will recommend that you
serve the files compressed.

Inside the audit environment I use the same webserver (Caddy) and a [similar
configuration][audit-caddy-config] (compared to the [one running on
bbaovanc.com][production-caddy-config]) to what I have running on bbaovanc.com.
Caddy also is able to easily run the demo site with HTTPS, even on localhost.
That allows it to test certain elements (such as the comment section) that
wouldn't be allowed to load if it were plain, unsecured HTTP.

[audit-caddy-config]: https://github.com/BBaoVanC/bbaovanc.com/blob/3668b6cfb11d09149b5da347219cdc75d0ce0985/Caddyfile
[production-caddy-config]: https://git.bbaovanc.com/configs/caddy/src/commit/e3227eb2a2679e27545c2417c2565941f03fb744/conf.d/bbaovanc.com

{{< see-also "/blog/caddy-is-the-best-webserver" >}}

I selected [a few significant pages on my website][lighthouse-urls] so
Lighthouse can test a wide range of the features in my website's theme. The
results of these tests are then uploaded to [my Lighthouse CI
server][lhci-dashboard]. There you can view the audit history and see
differences in results between builds.

[lighthouse-urls]: https://github.com/BBaoVanC/bbaovanc.com/blob/3668b6cfb11d09149b5da347219cdc75d0ce0985/lighthouserc.yaml#L4-L19
[lhci-dashboard]: https://lhci.bbaovanc.com/app/projects/bbaovanc.com/dashboard

## What I found from the tests

### Performance impact of a YouTube video

I found that embedding a YouTube video using the built-in shortcode in Hugo
made the website drastically slower. It's a lot clearer in the audit environment
where everything is throttled down a bunch, so the performance impact is more
clear. Below is a screenshot of the difference in score between my blog post
with a YouTube embed and a similarly sized blog post which has no video.

{{< figure src="youtube-embed-performance-comparison" >}}

I can probably optimize this a little by making a copy of the built-in Hugo
YouTube shortcode, and modifying it to defer the loading of the remote scripts.
That will have to be a future project, and I'll probably write a post if I ever
end up testing it.

## My thoughts on Lighthouse

You can make the argument that the results from Lighthouse don't really mean
much in the real world. On modern devices and a decent internet speed most
websites will load just fine.

Although most pages on my site have a perfect score from Lighthouse, I'm not
going to go way out of my way in order to keep it that way. After all,
Lighthouse is just a tool intended for "improving the quality of web
pages."[^improve-quality-quote] That doesn't mean it needs to be perfect.

[^improve-quality-quote]: Source: [Google
  Developers](https://developers.google.com/web/tools/lighthouse)
