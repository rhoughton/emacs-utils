(require 'string)

(defun insert-classname()
   (interactive)
   (insert (string-replace-match "\\..*$" (buffer-name) "::") ))

(defun insert-classname-inline()
   (interactive)
    (insert
"inline

" (string-replace-match "\\..*$" (buffer-name) "::" ) )
    (forward-line -1) ) 


(defun insert-classname-template()
  (interactive)
    (insert
"template< class T >
inline

" (string-replace-match "\\..*$" (buffer-name) "<T>::" ) )
    (forward-line -1) ) 

