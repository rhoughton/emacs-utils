;;
;;  File:	customize-24.3.el
;;  Project:	emacs-utils
;;  Desc:
;;
;;	Emacs customization
;;
;;  Author(s):   Paul Houghton <paul4hough@gmail.com>
;;  Created:     2013-10-08 10:09
;;

;;
;; Customization variables
;;
(custom-set-variables
 '(cvs-display-full-path nil)
 '(cvs-edit-confirm (quote changed))
 '(debug-on-error t)
 '(dired-verify-modtimes nil)
 '(display-time-mode t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(explicit-bash-args (quote ("-li")))
 '(mode-compile-make-options "" t)
 '(save-place t nil (saveplace))
 '(sh-indentation 2)
 '(sh-basic-offset 2)
 '(shell-file-name "/bin/bash")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 )
(custom-set-faces
 '(default ((t (:size "8pt" :family "Courier New"))) t)
 '(default ((t (:background "white"))) t)
 '(region ((t (:background "cyan"))) t)
 )
