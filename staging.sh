#!/bin/sh -ex
./audit.sh
./build.sh --baseURL "https://demo.bbaovanc.com/staging/$1"
rsync -avPzc --delete-delay public/ bbaosrv:/var/www/demo.bbaovanc.com/staging/$1/
