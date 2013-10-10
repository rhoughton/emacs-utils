;;
;;  File:	init-linux.el
;;  Project:	emacs-utils
;;  Desc:
;;
;;	Linux specific xemacs initialization
;;
;;  Notes:
;;
;;  Author(s):   Paul Houghton <paul4hough@gmail.com>
;;  Created:     05/08/2003 03:52
;;

(defvar system-short-name (replace-regexp-in-string
			   "\\..*"
			   ""
			   (system-name)))

(setq system-cc-search-directories (list "/usr/include"))
