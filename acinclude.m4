#
# File:		acinclude.m4
# Project:	emacs-utils
# Desc:
#
#   Project specific m4 macros
#
# Author(s):   Paul Houghton <paul4hough@gmail.com>
# Created:     06/01/2003 07:07
#

AC_DEFUN([PAH_PATH_LISPDIR],
[AC_ARG_WITH(lispdir,
  AC_HELP_STRING([--with-lispdir],[Override the default lisp directory]),
    [ lispdir="$withval"
      AC_MSG_RESULT([$lispdir])],
    [
     if test x${lispdir+set} != xset; then
       AC_CACHE_CHECK([where emacs package files should go], [pah_cv_lispdir],
       [# If $EMACS isn't GNU Emacs or XEmacs, this can blow up pretty badly
        # Some emacsen will start up in interactive mode, requiring C-x C-c to exit,
        #  which is non-obvious for non-emacs users.
        # Redirecting /dev/null should help a bit; pity we can't detect "broken"
        #  emacsen earlier and avoid running this altogether.
        AC_RUN_LOG([$EMACS -batch -q -l ${srcdir}/get-pkg-basedir.el -eval '(princ (get-pkg-basedir))' 2> /dev/null >conftest.out])
        pah_cv_lispdir=`echo \`cat conftest.out\``
        rm conftest.out
        if test -z "$pah_cv_lispdir" -o ! -w "$pah_cv_lispdir"; then
          pah_cv_lispdir='${datadir}/emacs/site-lisp'
        fi
       ])
       lispdir="$pah_cv_lispdir"
     fi
    ])
  AC_SUBST(lispdir)
])# PAH_PATH_LISPDIR
