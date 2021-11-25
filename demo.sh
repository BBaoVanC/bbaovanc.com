#!/bin/sh -x
rm -rf public/
HUGO_ENABLEMISSINGTRANSLATIONPLACEHOLDERS=true hugo -D --baseURL "https://demo.bbaovanc.com/test/$1"
rsync -avPzc --delete-delay public/ bbaosrv:/var/www/demo.bbaovanc.com/test/$1/
