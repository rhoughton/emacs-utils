;;; @(#) $Id$
;;;
;;; Title:            find-header.el
;;; 
;;; Description:
;;; 
;;; 	
;;; 
;;; Notes:
;;; 
;;; Programmer:	    Paul Houghton - (paul_houghton@wiltel.com)
;;; 
;;; Start Date:	    10/24/96 19:54
;;; 
;;; Modification History: (See end of File)
;;;

(require 'find-file)

(defvar header-name nil)
(defun find-header()
  "Find a header file"
  (interactive)
  (setq header-name
	(read-from-minibuffer "Enter Filename: " header-name ))
  (ff-get-file cc-search-directories header-name) )


;;; 
;;; $Log :$
;;; 

