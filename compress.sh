#!/bin/bash
# POSIX sh does not have time command so we must use bash

[ -z "$DEST" ] && echo "Please provide DEST variable for compress.sh" && exit 1

files=$(find "$DEST" -name "*.html" -o -name "*.xml" -o -name "*.css" -o -name "*.js" -o -name "*.svg")

time printf '%s\n' "$files" | parallel $@ "echo 'GZIP {}' && gzip -fnk {}"
time printf '%s\n' "$files" | parallel $@ "echo 'BROTLI {}' && brotli -fZk {}"
# level 9 chosen based on `zstd -b1 -e22 public/blog/swapfile-guide/index.html`
# gives a slightly better ratio than default (3)
time printf '%s\n' "$files" | parallel $@ "echo 'ZSTD {}' && zstd -q -f -9 {}"
