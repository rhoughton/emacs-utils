;;
;;  File:	init-linux.el
;;  Project:	XEmacsUtils
;;  Desc:
;;
;;	Linux specific xemacs initialization
;;
;;  Notes:
;;
;;  Author(s):   Paul Houghton <paul4hough@gmail.com>
;;  Created:     05/08/2003 03:52
;;

(require 'string)

(defvar system-short-name)
(if (string-match "\\." (system-name))
    (setq system-short-name (system-name))
  (setq system-short-name (string-replace-match "\\..*" (system-name) "" ) )
)

(setq system-cc-search-directories (list "/usr/include"))
;      (list "/opt/SUNWspro/WS6U2/include/CC/*"
;	    "/opt/SUNWspro/WS6U2/include/cc/*"
;	    "/usr/include/*" ))
