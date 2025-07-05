#!/bin/sh -ex
[ -z "$1" ] && echo "Please give a demo name" && exit 1
./audit.sh
DEST=public.staging/ ./build.sh --baseURL "https://demo.bbaovanc.com/staging/$1"
rsync -avPzc --delete-delay public.staging/ bbaosrv:/var/www/demo.bbaovanc.com/staging/$1/
