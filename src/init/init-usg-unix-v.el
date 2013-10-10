;;
;;  File:	init-usg-unix-v.el
;;  Project:	emacs-utils
;;  Desc:
;;
;;	Sun specific xemacs initializations
;;
;;  Notes:
;;
;;  Author(s):   Paul Houghton <paul4hough@gmail.com
;;  Created:     04/19/2003 16:58

(defvar system-short-name (system-name))

(setq system-cc-search-directories
      (list "/opt/SUNWspro/WS6U2/include/CC/*"
	    "/opt/SUNWspro/WS6U2/include/cc/*"
	    "/usr/include/*" ))
