# 2003-07-05 (cc) Paul Houghton <paul4hough@gmail.com>

EXTRA_DIST	=			\
	get-pkg-basedir.el		\
	README.md

SUBDIRS	= src tests/unit tests/system

test-system: check
	$(MAKE) -C tests/system "${@}-real"

clean:

check-system: test-system
