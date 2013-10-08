;;
;;  File:	insert-classname.el
;;  Project:	XEmacsUtils 
;;  Desc:
;;
;;	Emacs Lisp source
;;  
;;  Notes:
;;    
;;  Author(s):   Paul Houghton 719-527-7834 <paul.houghton@mci.com>
;;  Created:     07/05/2003 08:10
;;  
;;  Revision Info: (See ChangeLog or cvs log for revision history)
;;  
;;	$Author$
;;	$Date$
;;	$Name$
;;	$Revision$
;;	$State$
;;
;;  $Id$
;;

(defvar classname nil
  "classname to use for insert-classname")

(make-variable-buffer-local 'classname)

(defun get-classname()
  "return the classname for this buffer"
  (if (eq classname nil)
      (progn
	(setq classname
	      (file-name-sans-extension
	       (file-name-nondirectory (buffer-file-name))))))
  (concat classname "::")
  )
      
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