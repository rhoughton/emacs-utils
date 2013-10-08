dnl
dnl File:	configure.ac
dnl Project:	XEmacsUtils 
dnl Desc:
dnl
dnl   configuration source - see man autoconf
dnl
dnl Author(s):   Paul Houghton <paul4hough@gmail.com>
dnl Created:     07/05/2003 07:32
dnl

AC_PREREQ(2.69)
AC_INIT( XEmacsUtils,
	 1.02,
	 Paul Houghton <paul.houghton@mci.com> )

AM_INIT_AUTOMAKE([-Wno-portability])

AC_ARG_VAR( EMACS, which emacs to use (xemacs,emacs) default is xemacs )

PAH_PROG_EMACS
PAH_PATH_LISPDIR

AC_CONFIG_FILES([Makefile
		 src/Makefile
		 src/pah-misc/Makefile
		 src/init/Makefile])
AC_OUTPUT

