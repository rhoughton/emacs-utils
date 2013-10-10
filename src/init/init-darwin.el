;;
;;  File:	init-darwin
;;  Project:	emacs-utils
;;  Desc:
;;
;;	Mac (OSX-Darwin) specific xemacs initialization
;;
;;  Author(s):   Paul Houghton <paul4hough@gmail.com>
;;  Created:     05/27/2010 09:52
;;

(defvar system-short-name (replace-regexp-in-string
			   "\\..*"
			   ""
			   (system-name)))

(setq system-cc-search-directories (list "/usr/include"))
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
