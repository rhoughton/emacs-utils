#
# File:		Makefile.am
# Project:	XEmacsUtils
# Desc:
#
#   Build rules and targets
#
# Author(s):   Paul Houghton <paul4hough@gmail.com>
# Created:     05/16/2003 04:03
#

hide = @

elisp_sources	= $(wildcard *.el);

INSTALL_DIR	= $(HOME)/.xemacs

CLEANFILES	= $(ELCS)
ELCS		= $(elisp_sources:.el=.elc)
SUFFIXES 	= .elc .el

.el.elc:
	$(EMACS) -batch -q					    \
		-eval "(setq load-path (append '(\".\") load-path))" \
		-f batch-byte-compile $^
$(INSTALL_DIR):
	mkdir $@

$(INSTALL_DIR)/%.el : %.el
	$(hide) [ ! -f "$@" ] || mv "$@" "$@.`date +%F-%H%M%S`.bak"
	$(hide) install -p -c -m 444 "$^" "$@"
	@echo "+ Installed $@"

all-hook: $(ELCS)

install-data-hook: $(INSTALL_DIR) $(ELISP_SOURCES:%=$(INSTALL_DIR)/%)

