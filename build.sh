#!/bin/bash -ex
# POSIX sh doesn't have the time command

[ -z "$DEST" ] && DEST="public/"
rm -rf "$DEST"

hugo --printI18nWarnings --printPathWarnings -d "$DEST" $@
echo "$(git branch --show-current)-$(git describe --match='' --always --abbrev=0 --dirty)" > "$DEST"/version.txt

if [ -z "$NO_SEARCH" ]; then
    time pagefind --site "$DEST"
fi

if [ -z "$NO_COMPRESS" ]; then
    export DEST
    ./compress.sh
fi
