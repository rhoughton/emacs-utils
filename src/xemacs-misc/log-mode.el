;;; log-mode.el --- log mode, and its idiosyncratic commands.

;; Copyright (C) 1985, 1992, 1994 Paul Houghton

;; Maintainer: Paul Houghton

;;; Commentary:

;; This package provides the fundamental text mode documented in the
;; Emacs user's manual.

;;; Code:

(require 'timestamp)

(defvar log-mode-syntax-table nil
  "Syntax table used while in log mode.")

(defvar log-mode-abbrev-table nil
  "Abbrev table used while in log mode.")
(define-abbrev-table 'log-mode-abbrev-table ())

(if log-mode-syntax-table
    ()
  (setq log-mode-syntax-table (make-syntax-table))
  (modify-syntax-entry ?\" ".   " log-mode-syntax-table)
  (modify-syntax-entry ?\\ ".   " log-mode-syntax-table)
  (modify-syntax-entry ?' "w   " log-mode-syntax-table))


;(defun non-saved-text-mode ()
;  "Like text-mode, but delete auto save file when file is saved for real."
;  (text-mode)
;  (make-local-variable 'delete-auto-save-files)
;  (setq delete-auto-save-files t))

(defvar log-mode-map ()
  "Keymap for Indented Text mode.
All the commands defined in Text mode are inherited unless overridden.")

(if log-mode-map
    ()
  (setq log-mode-map (make-sparse-keymap))
  (set-keymap-name log-mode-map 'log-mode-map)
  (define-key log-mode-map 'f2  'insert-timestamp)
  (define-key log-mode-map "\t" 'indent-relative)
  (define-key log-mode-map "\es" 'center-line)
  (define-key log-mode-map "\eS" 'center-paragraph))

(defun log-mode ()
  "Major mode for editing time log file with indented paragraphs.
In this mode, paragraphs are delimited only by blank lines.
You can thus get the benefit of adaptive filling
 (see the variable `adaptive-fill-mode').
\\{indented-text-mode-map}
Turning on `log-mode' calls the value of the variable
`log-mode-hook', if that value is non-nil."
  (interactive)
  (kill-all-local-variables)
  (use-local-map log-mode-map)
  (define-abbrev-table 'log-mode-abbrev-table ())
  (setq local-abbrev-table log-mode-abbrev-table)
  (set-syntax-table log-mode-syntax-table)
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'indent-relative-maybe)
  (make-local-variable 'paragraph-start)
  (setq paragraph-start (concat "^$\\|" page-delimiter))
  (make-local-variable 'paragraph-separate)
  (setq paragraph-separate paragraph-start)
  (use-local-map log-mode-map)
  (setq mode-name "Log")
  (setq major-mode 'log-mode)
  (run-hooks 'log-mode-hook ))

(defun center-paragraph ()
  "Center each nonblank line in the paragraph at or after point.
See `center-line' for more info."
  (interactive)
  (save-excursion
    (forward-paragraph)
    (or (bolp) (newline 1))
    (let ((end (point)))
      (backward-paragraph)
      (center-region (point) end))))

(defun center-region (from to)
  "Center each nonblank line starting in the region.
See `center-line' for more info."
  (interactive "r")
  (if (> from to)
      (let ((tem to))
	(setq to from from tem)))
  (save-excursion
    (save-restriction
      (narrow-to-region from to)
      (goto-char from)
      (while (not (eobp))
	(or (save-excursion (skip-chars-forward " \t") (eolp))
	    (center-line))
	(forward-line 1)))))


;;; log-mode.el ends here
