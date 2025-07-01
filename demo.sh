#!/bin/sh -x
AUDIT=y ./build.sh --baseURL "https://demo.bbaovanc.com/test/$1"
rsync -avPzc --delete-delay public/ bbaosrv:/var/www/demo.bbaovanc.com/test/$1/
