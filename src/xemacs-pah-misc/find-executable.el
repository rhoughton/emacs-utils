;;;
;;; Title:	find-executable.el
;;; Project:	Emacs
;;; Desc:
;;; 
;;;	Return the absolute path name for a program or and emtpy
;;;	string if the program is not found.
;;;
;;;	    (find-executable "vi")
;;;
;;;	would return something like "/usr/bin/vi".
;;;
;;;	    (find-executable "not_a_program_in_path")
;;;
;;;     would return "".
;;; 
;;; Notes:
;;;
;;;	The ideas for this code came from 'info.el' and
;;;      pcl-cvs.el
;;;
;;; Author:	Paul A. Houghton - (houghton@cshore.wcom.com)
;;; Created:	12/29/96 16:45
;;; 
;;; Revision History: (See end of file for Revision Log)
;;;
;;;	Last Mod By:    $Author$
;;;	Last Mod:	$Date$
;;;	Version:	$Revision$
;;;
;;;	$Id$


(defun find-executable (prog)
  "Find the absolute path for 'prog' using the \`PATH\' environment
variable, and return it as a string. (i.e if diff is in /usr/bin
then (find-executable \"diff\") would return \"/usr/bin/diff\"."
  (let ((path-list
	(let ((path (getenv "PATH")))
	  (if path
	      (let ((list nil)
		    idx)
		(while (> (length path) 0)
		  (setq idx (or (string-match ":" path) (length path))
			list (cons (substring path 0 idx) list)
			path (substring path (min (1+ idx)
						  (length path)))))
		(nreverse list))
	    (list "/bin" "/usr/bin" "/usr/local/bin")))))
    (let (abs-exec)
      (setq abs-exec nil)
      (while path-list
	(if (stringp (car path-list))
	    (let ((abs-prog (expand-file-name prog (car path-list))))
	      (if (file-executable-p abs-prog)
		  (setq path-list nil
			abs-exec abs-prog))))
	(setq path-list (cdr path-list)))
      abs-exec))
  )

(provide 'find-executable)

;;; 
;;; $Log :$
;;; 

