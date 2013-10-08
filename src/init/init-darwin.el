;;
;;  File:	init-darwin
;;  Project:	XEmacsUtils
;;  Desc:
;;
;;	Mac (OSX-Darwin) specific xemacs initialization
;;
;;  Author(s):   Paul Houghton <paul4hough@gmail.com>
;;  Created:     05/27/2010 09:52
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

;
; From: http://blog.lathi.net/articles/2007/11/07/sharing-the-mac-clipboard-with-emacs
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
