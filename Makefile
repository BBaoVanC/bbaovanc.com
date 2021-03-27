all: public

public:
	hugo

clean:
	rm -rf public

push: clean public
	rsync -arvz -e 'ssh -p 2222' --progress --delete public/ bbaovanc.com:/var/www/bbaovanc/blog/

.PHONY: all clean push
