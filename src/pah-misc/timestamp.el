;;
;; Title:	timestamp.el
;; Project:	emacs-utils
;; Desc:
;;
;;	find fn in parent directory
;;
;; Author:	Paul Houghton <paul4hough@gmail.com>
;; Created:	1995-11-13 06:20

(defconst month-name-abrv-asso
  '(("Jan" . 1)  ("Feb" . 2)  ("Mar" . 3)
    ("Apr" . 4)  ("May" . 5)  ("Jun" . 6)
    ("Jul" . 7)  ("Aug" . 8)  ("Sep" . 9)
    ("Oct" . 10) ("Nov" . 11) ("Dec" . 12)
   )
  )

;;;###autoload
(defun timestamp ()
  "Return a formated timestamp string with the current
date and time. Example: 1993-05-15 03:20:15"
  (format "%04d-%02d-%02d %s"
	  (string-to-int (substring (current-time-string) 20 24))
	  (cdr (assoc (substring (current-time-string) 4 7)
		      month-name-abrv-asso))
	  (string-to-int (substring (current-time-string) 8 10))
	  (substring (current-time-string) 11 16)
	  ) )

;;;###autoload
(defun insert-timestamp ()
  "Insert a timestamp into the current buffer"
  (interactive
   (insert (timestamp))))

(provide 'timestamp)
