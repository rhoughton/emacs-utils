;;;
;;; Title:	dot.emacs
;;; Project:	XEmacsUtils
;;; Desc:
;;;
;;;	Xemacs Initialization file.
;;;
;;; Author:	Paul A. Houghton <paul4hough@gmail.com>
;;; Created:	12/26/96 10:47

(if (string-match "XEmacs\\|Lucid" emacs-version)
    (load (concat (getenv "HOME")
		  "/.xemacs/init"))
  (message "Load .emacs  (XEmacs) done")
  (
;; Swiped from Red Hat Linux default .emacs initialization file  ; -*- mode: emacs-lisp -*-

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
;; (global-set-key [delete] 'delete-char)
;; (global-set-key [kp-delete] 'delete-char)

;; turn on font-lock mode
;; (global-font-lock-mode t)
;; enable visual feedback on selections
;; (setq-default transient-mark-mode t)

;; always end a file with a newline
;; (setq require-final-newline t)

;; stop at the end of the file, not just add lines
;; (setq next-line-add-newlines nil)

;;(when window-system
  ;; enable wheelmouse support by default
;;  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
;;  (set-selection-coding-system 'compound-text-with-extensions))

;; (custom-set-variables
;; '(load-home-init-file t t))
;; (custom-set-faces)


;; (message "Load .emacs  (emacs) done")
))

;;; Local Variables:
;;; mode:emacs-lisp
;;; End:
