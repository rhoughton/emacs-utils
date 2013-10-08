dnl
dnl File:		configure.ac
dnl Project:	XEmacsUtils 
dnl Desc:
dnl
dnl   
dnl
dnl Notes:
dnl
dnl Author(s):   Paul Houghton 719-527-7834 paul.houghton@mci.com
dnl Created:     07/05/2003 07:32
dnl
dnl Revision Info: (See ChangeLog or cvs log for revision history)
dnl
dnl	$Author$
dnl	$Date$
dnl	$Name$
dnl	$Revision$
dnl	$State$
dnl
dnl $Id$
dnl


AC_PREREQ(2.57)
AC_INIT( XEmacsUtils,
	 1.01,
	 Paul Houghton <paul.houghton@mci.com> )

AM_INIT_AUTOMAKE

AC_ARG_VAR( EMACS, which emacs to use (xemacs,emacs) default is xemacs )

PAH_PROG_EMACS
PAH_PATH_LISPDIR

AC_CONFIG_FILES([Makefile
		 src/Makefile
		 src/xemacs-pah-misc/Makefile
		 src/xemacs-misc/Makefile])
AC_OUTPUT

