;;
;;  File:	customize-21.4.el
;;  Project:	XEmacsUtils
;;  Desc:
;;
;;	XEmacs 21.4 customization
;;
;;  Author(s):   Paul Houghton <paul4hough@gmail.com>
;;  Created:     05/16/2003 04:20
;;

;;
;; Customization variables
;;
(custom-set-variables
 '(cvs-display-full-path nil)
 '(cvs-edit-confirm (quote changed))
 '(dired-verify-modtimes nil)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(explicit-bash-args (quote ("-li")))
 '(mode-compile-make-options "" t)
 '(recent-files-add-menu-before "Open...")
 '(recent-files-menu-path (quote ("File")))
 '(recent-files-non-permanent-submenu nil)
 '(shell-file-name "/bin/bash")
 '(toolbar-mail-reader (quote vm)))
;; (custom-set-faces
;; '(default ((t (:size "8pt" :family "Courier New"))) t))
(custom-set-faces
 '(default ((t (:background "white"))) t))
