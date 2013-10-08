#
# File:		Makefile.am
# Project:	XEmacsUtils 
# Desc:
#
#   automake source for Makefile.in
#
# Author(s):   Paul Houghton <paul4hough@gmail.com>
# Created:     07/05/2003 07:49
#

hide = @

elisp_sources	=				\
        TODO-mode.el				\
        _pkg.el					\
        ascii-table.el				\
        auto-autoloads.el			\
        cobol.el				\
        custom-load.el				\
        ff-find-file.el				\
        find-executable.el			\
        find-header.el				\
        find-up-dir.el				\
        insert-classname.el			\
        log-mode.el				\
        php-mode.el				\
        puppet-mode.el				\
        timestamp.el

XEmacs_elisp_sources	=			\
	$(elisp_sources)			\
	_pkg.el					\
	auto-autoloads.el			\
	custom-load.el

XEmacs_lisp_dir	= $(lispdir)/lisp/pah-misc

CLEANFILES	= $(ELCS)
ELCS		= $(XEmacs_el_sources:.el=.elc)
SUFFIXES 	= .elc .el

.el.elc:
	$(EMACS) -batch -q					    \
		-eval "(setq load-path (append '(\".\") load-path))" \
		-f batch-byte-compile $^

_pkg.el: $(top_srcdir)/configure.ac
	@echo Creating $@
	@echo ";;;###autoload" > $@
	@echo "(package-provide '$(PACKAGE_NAME)" >> $@
	@echo "		 :version $(VERSION)" >> $@
	@echo "		 :type '$(PKG_TYPE))" >> $@

auto-autoloads.el : $(elisp_sources) $(AUTOLOAD_PATH)/_pkg.el
	$(EMACS) $(VANILLA) -batch \
		-l autoload 	\
		-f batch-update-autoloads 	\
		. $@
	@rm -f $(AUTOLOAD_PATH)/auto-autoloads.el~

custom-load.el : $(elisp_sources)
	$(EMACS) $(VANILLA) -batch -l cus-dep 				\
		-f Custom-make-dependencies $(AUTOLOAD_PATH)

XEmacs_install: $(ELCS)
	$(hide) $(mkinstalldirs) $(DESTDIR)$(XEmacs_lisp_dir)
	$(hide) for f in $(XEmacs_el_sources) $(ELCS) ; do   \
	  $(INSTALL) $$f $(DESTDIR)$(XEmacs_lisp_dir) ;	     \
	  echo "Installed $(DESTDIR)$(XEmacs_lisp_dir)/$$f"; \
	done

all-hook: $(ELCS) custom-load.elc auto-autoloads.elc _pkg.elc
check: all
install-data-hook: all XEmacs_install
