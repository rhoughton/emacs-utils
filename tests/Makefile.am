#
# File:		Makefile.am
# Project:	XEmacsUtils 
# Desc:
#
#   automake source for Makefile.in
#
# Author(s):   Paul Houghton <paul4hough@gmail.com>
# Created:     2013-10-08 08:24
#

PHONY=check test all

#: same thing as "check"
test: check

test_files := $(wildcard test-*.el)

CHECK_FILES = $(notdir $(test_files:.el=.run))

#: Run all tests
check: $(CHECK_FILES)

test-%.run:
	(cd $(top_srcdir)/test && $(EMACS) --batch --no-site-file --no-splash --load $(@:.run=.el))


