;;
;;  File:	init-cygwin32.el
;;  Project:	XEmacsUtils
;;  Desc:
;;
;;	cygwin xemacs initialization
;;
;;  Author(s):   Paul Houghton <paul4hough@gmail.com
;;  Created:     05/08/2003 03:52
;;

(defvar system-short-name (system-name))

(setq system-cc-search-directories (list "/usr/include"))
;      (list "/opt/SUNWspro/WS6U2/include/CC/*"
;	    "/opt/SUNWspro/WS6U2/include/cc/*"
;	    "/usr/include/*" ))
