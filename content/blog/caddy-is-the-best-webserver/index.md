---

title: Caddy is literally the best webserver
date: 2021-11-13T00:43:35-06:00
lastmod: 2022-05-02T00:54:43-05:00
toc: true
comments: true

authors:
  - bbaovanc

categories:
  - linux
  - sysadmin
  - software

tags:
  - caddy
  - webserver

resources:
  - name: feature
    src: caddy.webp
    title: >-
      Image source:
      [Caddy](https://caddyserver.com/resources/images/caddy-logo.svg)

  - name: caddy-browse
    src: caddy-browse.webp
    title: >-
      Caddy's gorgeous directory list page.

---

After switching from NGINX to Caddy on all of my websites, I have come to the
conclusion that Caddy is the best webserver in existence. With automatic HTTPS,
a simple configuration file, and more, Caddy is just the best webserver overall
for general use.

<!--more-->

## Built-in automatic HTTPS

Caddy can fetch certificates from Let's Encrypt and ZeroSSL out of the box.
HTTPS is enabled by default for eligible domains[^hostname-requirements], unless
you explicitly tell it not to.

### Incredible cipher security

Caddy has incredible defaults for TLS/SSL ciphers. Any site you host on Caddy
gets a perfect score from [Qualys SSL Labs](https://www.ssllabs.com/ssltest/)
out of the box.[^caddy-qualys-score]

## Dead simple configuration files: Caddy vs NGINX

Caddy's configuration file format is the easiest out of all the main webserver.
The best way for me to demonstrate this simplicity is to compare it to one of
the most popular webservers: [NGINX](https://www.nginx.com/).

### Serving some static files

The most essential feature you can use a webserver for.

#### Caddy

```caddyfile
example.com {
  root * /var/www/example.com
  file_server
}
```

#### NGINX

```nginx
server {
    listen 80;
    server_name example.com;
    index index.html index.txt;
    root /var/www/example.com;
    location / {
        try_files $uri $uri/ =404;
    }
}
```

As you can see, the Caddy config is a lot simpler than the NGINX one. But wait,
there's more! This NGINX config is unencrypted HTTP only, but the Caddy one will
automatically request a certificate from Let's Encrypt, enable HTTPS, and even
redirect unencrypted HTTP to HTTPS.

From now on, for the sake of simplicity, I'll be ignoring HTTPS for the NGINX
configs.

### PHP (PrivateBin)

The Caddy config for this example is the same as the [one used for
bin.boba.best](https://git.boba.best/boba.best/caddy/src/commit/cd00151fbdd784979a8a181980cc36061be68c7d/conf.d/bin.boba.best).
I've stripped it down a bit by removing the [custom error
pages](https://git.boba.best/boba.best/caddy/src/commit/cd00151fbdd784979a8a181980cc36061be68c7d/Caddyfile#L15-L24),
[HSTS](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security), [zstd
compression](https://github.com/facebook/zstd), and logging.

#### Caddy

```caddyfile
bin.boba.best {
    encode gzip

    root * /var/www/bin.boba.best
    php_fastcgi unix//run/php/php-fpm.sock
    file_server
}
```

#### NGINX

```nginx
server {
    listen 80;
    server_name bin.boba.best;
    index index.html index.txt index.php;
    root /var/www/bin.boba.best;
    gzip on;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php-fpm.sock;
    }
}
```

### Reverse proxy + static files (Gitea)

This last example is based on
[git.bbaovanc.com](https://git.bbaovanc.com/boba.best/caddy/src/commit/57c9f0011eae92ef5fa2992d99f01b0956802d64/conf.d/git.bbaovanc.com).
Just like the last example, I've stripped off the custom error pages, HSTS, zstd
compression, and logging.

#### Caddy

```caddyfile
git.bbaovanc.com {
    encode gzip

    handle_path /_/static/assets/* {
        root * /var/www/git.bbaovanc.com/public
        file_server
    }

    handle {
        reverse_proxy localhost:81 {
            header_up X-Real-IP {remote_host}
        }
    }
}
```

#### NGINX

```nginx
server {
    listen 80;
    server_name git.bbaovanc.com;
    gzip on;

    location /_/static/assets {
        alias /var/www/git.bbaovanc.com/public/;
    }

    location / {
        proxy_pass http://localhost:81;
        proxy_set_header X-Real-IP $remote_addr;
    }
```

Although in this case the NGINX config was slightly shorter, I find the Caddy
one a lot more clear and easy to understand. With NGINX, I find it weird how
adding a trailing slash or not defines whether the prefix (`/_/static/assets` in
this case) is stripped before searching the filesystem. In Caddy, you can use
the `handle_path` directive, instead of just a regular `handle` directive.

You can read more about how `handle` and `handle_path` work in Caddy on the
[Caddy docs](https://caddyserver.com/docs/caddyfile/directives/handle).

## The smaller details

These features might not matter to you, but this is my blog, and I care about
them, so I'll be including them.

### Go templates

Caddy is written in Go and supports [Go
templates](https://pkg.go.dev/text/template). This means you can make simple
dynamic content while only using Caddy!

In fact, the [official Caddy website](https://caddyserver.com) is generated
entirely using Caddy's and Go templates![^caddy-templating]

#### Error pages using HTTP Cats

I use [this
snippet](https://git.bbaovanc.com/boba.best/caddy/src/commit/57c9f0011eae92ef5fa2992d99f01b0956802d64/Caddyfile#L8-L15)
on both bbaovanc.com and boba.best to make custom error pages using images from
[HTTP Cats](https://http.cat). It uses Caddy's template support to generate some
simple HTML to show the error code, name, and cat image.

### Beautiful autoindex file browser

Apache and NGINX both have an optional "autoindex" feature which generates a
list of files in a directory when there's no page there. However, it looks very
ugly. Caddy, on the other hand, still has a simple index page, but looks a
thousand times better.

Coincidentally, it matches the theme of my website very well, so I have to put a
border around the image.

{{< figure src="caddy-browse" >}}


[^hostname-requirements]: For the rules on what domains have automatic HTTPS by
  default, see ["Hostname requirements" on the Caddy
  documentation](https://caddyserver.com/docs/automatic-https#hostname-requirements).

[^caddy-qualys-score]: SSL Labs caps the score to an A if HSTS isn't enabled.
  After enabling it, then you get a perfect A+ score. See [my website's
  score](https://www.ssllabs.com/ssltest/analyze.html?d=bbaovanc.com&latest)
  ([archived](https://archive.today/4JJDN)) for an example (bbaovanc.com).

[^caddy-templating]: See more info about templating [on the Caddy
  docs](https://caddyserver.com/docs/caddyfile/directives/templates#examples)
