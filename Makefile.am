#
# File:		Makefile.am
# Project:	XEmacsUtils 
# Desc:
#
#   automake source for Makefile.in
#
# Author(s):   Paul Houghton <paul4hough@gmail.com>
# Created:     07/05/2003 07:39
#

EXTRA_DIST	=				\
	get-pkg-basedir.el

SUBDIRS	= src

# hack to work around automake
NEWS AUTHORS:
	touch $@
README:
	ln -s README.md $@