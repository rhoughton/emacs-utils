
(defconst month-name-abrv-asso
  '(("Jan" . 1)  ("Feb" . 2)  ("Mar" . 3)  
    ("Apr" . 4)  ("May" . 5)  ("Jun" . 6)
    ("Jul" . 7)  ("Aug" . 8)  ("Sep" . 9)  
    ("Oct" . 10) ("Nov" . 11) ("Dec" . 12)
   )
  )

(defun timestamp ()
  "Return a formated timestamp string with the current
date and time. Example: 05/15/93 03:20:15"
  (format "%02d/%02d/%02d %s"
	  (cdr (assoc (substring (current-time-string) 4 7)
		      month-name-abrv-asso))
	  (string-to-int (substring (current-time-string) 8 10))
	  (string-to-int (substring (current-time-string) 22 24))
	  (substring (current-time-string) 11 16)
	  ) )

(defun insert-timestamp ()
  "Insert a timestamp into the current buffer"
  (interactive
   (insert (timestamp))))

(provide 'timestamp)

