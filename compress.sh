#!/bin/sh

files=$(find public/ -name "*.html" -o -name "*.xml" -o -name "*.css" -o -name "*.js" -o -name "*.svg")

printf '%s\n' "$files" | parallel $@ "echo 'GZIP {}' && gzip -fnk {}"
printf '%s\n' "$files" | parallel $@ "echo 'BROTLI {}' && brotli -fZk {}"
