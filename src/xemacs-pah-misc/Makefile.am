#
# File:		Makefile.am
# Project:	XEmacsUtils 
# Desc:
#
#   automake source for Makefile.in
#
# Notes:
#
# Author(s):   Paul Houghton 719-527-7834 paul.houghton@mci.com
# Created:     07/05/2003 07:56
#
# Revision Info: (See ChangeLog or cvs log for revision history)
#
#	$Author$
#	$Date$
#	$Name$
#	$Revision$
#	$State$
#
# $Id$
#

elisp_sources	=				\
	find-executable.el			\
	find-header.el				\
	find-up-dir.el				\
	insert-classname.el

XEmacs_el_sources	=			\
	$(elisp_sources)			\
	$(AUTOLOAD_PATH)/_pkg.el		\
	$(AUTOLOAD_PATH)/auto-autoloads.el


#	$(AUTOLOAD_PATH)/custom-load.el

XEmacs_pkg_name	= xemacs-pah-misc

XEmacs_lisp_dir	= $(lispdir)/lisp/$(XEmacs_pkg_name)

XEmacs_install_dirs	=			\
	$(XEmacs_lisp_dir)

PKG_TYPE		= regular
AUTOLOAD_PATH		= .
AUTOLOAD_PACKAGE_NAME 	= $(XEmacs_pkg_name)

ELCS	=	$(XEmacs_el_sources:.el=.elc)

CLEANFILES		= $(ELCS)

hide = @

SUFFIXES = .elc .el

.el.elc:
	$(EMACS) -batch -q					    \
		-eval "(setq load-path (append '(\".\") load-path))" \
		-f batch-byte-compile $^

$(AUTOLOAD_PATH)/_pkg.el: $(top_srcdir)/configure.ac
	@echo Creating $@
	@echo ";;;###autoload" > $@
	@echo "(package-provide '$(PACKAGE_NAME)" >> $@
	@echo "		 :version $(VERSION)" >> $@
	@echo "		 :type '$(PKG_TYPE))" >> $@

$(AUTOLOAD_PATH)/auto-autoloads.el : $(elisp_sources) $(AUTOLOAD_PATH)/_pkg.el
	$(EMACS) $(VANILLA) -batch \
		-l autoload 	\
		-f batch-update-directory-autoloads 	\
		"$(AUTOLOAD_PACKAGE_NAME)" $(AUTOLOAD_PATH)
	@rm -f $(AUTOLOAD_PATH)/auto-autoloads.el~

#$(AUTOLOAD_PATH)/custom-load.el : $(elisp_sources)
#	$(EMACS) $(VANILLA) -batch -l cus-dep 				\
#		-f Custom-make-dependencies $(AUTOLOAD_PATH)

XEmacs_install: $(ELCS)
	$(hide) $(mkinstalldirs) $(DESTDIR)$(XEmacs_lisp_dir)
	$(hide) for f in $(XEmacs_el_sources) $(ELCS) ; do   \
	  $(INSTALL) $$f $(DESTDIR)$(XEmacs_lisp_dir) ;	     \
	  echo "Installed $(DESTDIR)$(XEmacs_lisp_dir)/$$f"; \
	done

install-data-hook: XEmacs_install
