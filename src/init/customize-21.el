;;
;;  File:	customize-21.5.el
;;  Project:	XEmacsUtils
;;  Desc:
;;
;;	XEmacs 21.5 customizations
;;
;;  Author(s):   Paul Houghton <paul4hough@gmail.com>
;;  Created:     05/16/2003 04:20
;;

;;
;; Customization variables
;;
(custom-set-variables
 '(cvs-edit-confirm 'changed)
 '(dired-verify-modtimes nil)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(explicit-bash-args '("-li")
)
 '(mode-compile-make-options "" t)
 '(recent-files-add-menu-before "Open...")
 '(recent-files-menu-path '("File")
)
 '(recent-files-non-permanent-submenu nil)
 '(shell-file-name "/bin/bash"))
(custom-set-faces
 '(default ((t (:size "14pt" :family "Lucidatypewriter" :background "white"))) t))
