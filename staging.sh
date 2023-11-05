#!/bin/sh -x
rm -rf public/
HUGO_ENABLEMISSINGTRANSLATIONPLACEHOLDERS=true hugo --printI18nWarnings --printPathWarnings --baseURL "https://demo.bbaovanc.com/staging/$1"
./compress.sh
rsync -avPzc --delete-delay public/ bbaosrv:/var/www/demo.bbaovanc.com/staging/$1/
