#!/bin/sh -ex

[ -z "$DEST" ] && DEST="public/"
rm -rf "$DEST"

hugo --printI18nWarnings --printPathWarnings -d "$DEST" $@

if [ -z "$NO_COMPRESS" ]; then
    export DEST
    ./compress.sh
fi
