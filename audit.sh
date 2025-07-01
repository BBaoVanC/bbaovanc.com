#!/bin/sh -x

# AUDIT flag already skips compression and search generation
HUGO_MINIFY_TDEWOLFF_HTML_KEEPCOMMENTS=true HUGO_ENABLEMISSINGTRANSLATIONPLACEHOLDERS=true hugo --buildDrafts --printI18nWarnings --printPathWarnings -d public.audit/

# https://gohugo.io/troubleshooting/audit/
! grep -inorE "<\!-- raw HTML omitted -->|ZgotmplZ|\[i18n\]|\(<nil>\)|(&lt;nil&gt;)|hahahugo" public.audit/

# see layouts/baseof.html in bobatheme
! grep -inorE "YUZSIQGHE" public.audit/

rm -r public.audit/
