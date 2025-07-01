#!/bin/sh -x

rm -rf public/
if [ -n "$AUDIT" ]; then
    echo "Using audit command"
    HUGO_MINIFY_TDEWOLFF_HTML_KEEPCOMMENTS=true HUGO_ENABLEMISSINGTRANSLATIONPLACEHOLDERS=true hugo --buildDrafts --printI18nWarnings --printPathWarnings $@
else
    echo "Using regular command"
    hugo --printI18nWarnings --printPathWarnings $@
fi
