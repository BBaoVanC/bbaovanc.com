#!/bin/sh -ex
./audit.sh
DEST=public.demo/ ./build.sh --baseURL "https://demo.bbaovanc.com/test/$1"
rsync -avPzc --delete-delay public.demo/ bbaosrv:/var/www/demo.bbaovanc.com/test/$1/
