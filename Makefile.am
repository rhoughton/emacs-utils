#
# File:		Makefile.am
# Project:	emacs-utils
# Desc:
#
#   automake source for Makefile.in
#
# Author(s):   Paul Houghton <paul4hough@gmail.com>
# Created:     07/05/2003 07:39
#

EXTRA_DIST	=			\
	get-pkg-basedir.el		\
	LICENSE				\
	README.md

SUBDIRS	= src tests/unit tests/system

test-system: check
	$(MAKE) -C tests/system "${@}-real"

clean:

check-system: test-system
