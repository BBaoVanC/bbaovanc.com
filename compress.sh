#!/bin/sh

files=$(find public/ -name "*.html" -o -name "*.xml" -o -name "*.css" -o -name "*.js" -o -name "*.svg")

printf '%s\n' "$files" | parallel $@ "echo 'GZIP {}' && gzip -fnk {}"
printf '%s\n' "$files" | parallel $@ "echo 'BROTLI {}' && brotli -fZk {}"
# level 9 chosen based on `zstd -b1 -e22 public/blog/swapfile-guide/index.html`
# gives a slightly better ratio than default (3)
printf '%s\n' "$files" | parallel $@ "echo 'ZSTD {}' && zstd -f -9 {}"
