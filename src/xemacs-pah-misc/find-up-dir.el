;;;
;;; Title:	find-up-dir.el
;;; Project:	XEmacs
;;; Desc:
;;; 
;;;	
;;; 
;;; Notes:
;;; 
;;; Author:	Paul Houghton - (paul.houghton@wcom.com)
;;; Created:	03/03/01 03:35
;;; 
;;; Revision History: (See end of file for Revision Log)
;;;
;;;	Last Mod By:    $Author$
;;;	Last Mod:	$Date$
;;;	Version:	$Revision$
;;;
;;;	$Id$


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

;;; 
;;; $Log :$
;;; 

;;; Set XEmacs mode
;;;
;;; Local Variables:
;;; mode Emacs-lisp
;;; End:

