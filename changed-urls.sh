#!/bin/sh

diff -qrNtbB old/ new/ |
    grep -oP '(?<=\s)new\/\S*' |
    xargs -d '\n' ls -1d 2>/dev/null |
    grep 'index.html$' |
    sed 's/index.html$//' |
    sed "s/^new/${SCHEME:=http}:\/\/${DOMAIN:=example.com}/"
