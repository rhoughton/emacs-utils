;;
;;  File:	insert-classname.el
;;  Project:	emacs-utils
;;  Desc:
;;
;;	insert current source class name
;;  
;;  Notes:
;;    
;;  Author(s):   Paul Houghton <paul4hough@gmail.com>
;;  Created:     07/05/2003 08:10
;;  

(defvar classname nil
  "classname to use for insert-classname")

(make-variable-buffer-local 'classname)

(defun get-classname()
  "return the classname for this buffer"
  (if (eq classname nil)
      (if (not (eq buffer-file-name nil))
	  (progn
	    (setq classname
		  (file-name-sans-extension
		   (file-name-nondirectory (buffer-file-name)))))
	(progn
	  (setq classname "FIXME")))
    (concat classname "::")))
      
;;;###autoload
(defun insert-classname()
  "insert c++ classname for the current file at point"
  (interactive)
  (insert (get-classname) )
  )

;;;###autoload
(defun insert-classname-inline()
  "insert c++ inline funct impl for the current file at point"
  (interactive)
  (insert
   "inline

" (get-classname))
  (forward-line -1)
  )

;;;###autoload
(defun insert-classname-template()
  (interactive)
    (insert
"template< class T >
inline

" (get-classname) )
    (forward-line -1) ) 

(provide 'insert-classname)
