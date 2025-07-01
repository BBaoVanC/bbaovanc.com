#!/bin/sh -x
./build.sh --baseURL "https://demo.bbaovanc.com/staging/$1"
./compress.sh
rsync -avPzc --delete-delay public/ bbaosrv:/var/www/demo.bbaovanc.com/staging/$1/
