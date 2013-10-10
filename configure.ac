dnl
dnl File:	configure.ac
dnl Project:	emacs-utils
dnl Desc:
dnl
dnl   configuration source - see man autoconf
dnl
dnl Author(s):   Paul Houghton <paul4hough@gmail.com>
dnl Created:     07/05/2003 07:32
dnl
dnl FIXME - find ispell

dnl - kick jenkins (i hope)
AC_PREREQ(2.69)
AC_INIT( emacs-utils,
	 1.02.00,
	 Paul Houghton <paul4hough@gmail.com> )

AM_INIT_AUTOMAKE([-Wno-portability])

AC_PATH_PROG([EMACS], [emacs], [emacs])

AC_MSG_NOTICE("Checking emacs version and prerequiste packages")
$EMACS -batch -q -no-site-file -eval \
  '(if (<= emacs-major-version 20)
       (progn
         (error "You need GNU Emacs 21 or better.")
         (kill-emacs 1)
       )
   )'
if test $? -ne 0 ; then
  AC_MSG_ERROR([Can't continue until above error is corrected.])
fi

PAH_PATH_LISPDIR

AC_CONFIG_FILES([Makefile
		 src/Makefile
		 src/pah-misc/Makefile
		 src/init/Makefile
		 tests/unit/Makefile
		 tests/system/Makefile])
AC_OUTPUT

