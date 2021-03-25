all: public

public: clean
	hugo

clean:
	rm -rf public

push: public
	rsync -arvz -e 'ssh -p 2222' --progress --delete public/ bbaovanc.com:/var/www/bbaovanc/blog/

.PHONY: all clean
