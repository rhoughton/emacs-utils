;;; todo-mode.el --- todo mode, and its idiosyncratic commands.

;; Copyright (C) 1985, 1992, 1994 Paul Houghton

;; Maintainer: Paul Houghton

;;; Commentary:

;; This package provides the fundamental text mode documented in the
;; Emacs user's manual.

;;; Code:

(require 'timestamp)

(defvar todo-mode-syntax-table nil
  "Syntax table used while in todo mode.")

(defvar todo-mode-abbrev-table nil
  "Abbrev table used while in todo mode.")
(define-abbrev-table 'todo-mode-abbrev-table ())

(if todo-mode-syntax-table
    ()
  (setq todo-mode-syntax-table (make-syntax-table))
  (modify-syntax-entry ?\" ".   " todo-mode-syntax-table)
  (modify-syntax-entry ?\\ ".   " todo-mode-syntax-table)
  (modify-syntax-entry ?' "w   " todo-mode-syntax-table))


;(defun non-saved-text-mode ()
;  "Like text-mode, but delete auto save file when file is saved for real."
;  (text-mode)
;  (make-local-variable 'delete-auto-save-files)
;  (setq delete-auto-save-files t))

(defun insert-todo-item ()
    "Insert a todo item into the current buffer"
  (interactive
   (insert "ENH " (user-full-name) " " (timestamp))))

(defvar todo-mode-map ()
  "Keymap for Indented Text mode.
All the commands defined in Text mode are inherited unless overridden.")

(if todo-mode-map
    ()
  (setq todo-mode-map (make-sparse-keymap))
  (set-keymap-name todo-mode-map 'todo-mode-map)
  (define-key todo-mode-map 'f2  'insert-todo-item)
  (define-key todo-mode-map "\t" 'indent-relative)
  (define-key todo-mode-map "\es" 'center-line)
  (define-key todo-mode-map "\eS" 'center-paragraph))

(defun todo-mode ()
  "Major mode for editing time todo file with indented paragraphs.
In this mode, paragraphs are delimited only by blank lines.
You can thus get the benefit of adaptive filling
 (see the variable `adaptive-fill-mode').
\\{indented-text-mode-map}
Turning on `todo-mode' calls the value of the variable
`todo-mode-hook', if that value is non-nil."
  (interactive)
  (kill-all-local-variables)
  (use-local-map todo-mode-map)
  (define-abbrev-table 'todo-mode-abbrev-table ())
  (setq local-abbrev-table todo-mode-abbrev-table)
  (set-syntax-table todo-mode-syntax-table)
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'indent-relative-maybe)
  (make-local-variable 'paragraph-start)
  (setq paragraph-start (concat "^$\\|" page-delimiter))
  (make-local-variable 'paragraph-separate)
  (setq paragraph-separate paragraph-start)
  (use-local-map todo-mode-map)
  (setq mode-name "TODO")
  (setq major-mode 'todo-mode)
  (run-hooks 'todo-mode-hook ))

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

;;; todo-mode.el ends here
