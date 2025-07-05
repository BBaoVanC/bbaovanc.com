#!/bin/sh -ex
[ -z "$1" ] && echo "Please give a demo name" && exit 1
./audit.sh
DEST=public.demo/ ./build.sh --baseURL "https://demo.bbaovanc.com/test/$1"
rsync -avPzc --delete-delay public.demo/ bbaosrv:/var/www/demo.bbaovanc.com/test/$1/
