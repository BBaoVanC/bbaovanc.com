#!/bin/sh -x
rm -rf public/
hugo -D --baseURL "https://demo.bbaovanc.com/test/$1"
rsync -atvPz --delete public/ bbaosrv:/var/www/demo.bbaovanc.com/test/$1/
