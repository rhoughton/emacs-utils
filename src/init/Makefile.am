#
# File:		Makefile.am
# Project:	emacs-utils
# Desc:
#
#   Build rules and targets
#
# Author(s):   Paul Houghton <paul4hough@gmail.com>
# Created:     05/16/2003 04:03
#

# ping jenkins

hide = @

elisp_sources	= $(wildcard *.el)
EXTRA_DIST	= $(elisp_sources)

INSTALL_DIR	= $(HOME)/.emacs.d

CLEANFILES	= $(ELCS)
ELCS		= $(elisp_sources:.el=.elc)
SUFFIXES 	= .elc .el

.el.elc:
	$(EMACS) -batch -q					    \
		-eval "(setq load-path (append '(\".\") '(\"../pah-misc\") load-path))" \
		-f batch-byte-compile $^
$(INSTALL_DIR):
	mkdir $@

$(INSTALL_DIR)/%.el : %.el
	$(hide) [ ! -f "$@" ] || mv "$@" "$@.`date +%F-%H%M%S`.bak"
	$(hide) $(INSTALL) -p -m 444 "$^" "$@"
	@echo "+ Installed $@"

all: $(ELCS)
check: all
install-data-hook: $(INSTALL_DIR) $(elisp_sources:%=$(INSTALL_DIR)/%)

%: 
	$(MAKE) -C .. $@

