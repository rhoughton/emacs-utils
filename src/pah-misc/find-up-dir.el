;;
;; Title:	find-up-dir.el
;; Project:	emacs-utils
;; Desc:
;; 
;;	find fn in parent directory
;; 
;; Author:	Paul Houghton <paul4hough@gmail.com>
;; Created:	03/03/01 03:35

(defun find-up-dir (fn)
  "Search up the path for `fn' and return the path to it
   (i.e. `../..')"
  (let ((updir "..")
	(dir default-directory))
    (let (up)
      (setq up nil)
      (while (> (length dir) 1)
	(if (file-exists-p (concat updir "/" fn))
	    (setq up (concat updir "/" fn)
		  dir nil)
	  (progn (setq updir (concat updir "/.."))
		 (let (idx)
		   (setq idx (or (string-match "/" dir) (length dir))
			 dir (substring dir (min (1+ idx)
						 (length dir))))))))
      up)))


(provide 'find-up-dir)

;; Set XEmacs mode
;;
;; Local Variables:
;; mode: Emacs-lisp
;; End:

