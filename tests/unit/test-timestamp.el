;; 2013-10-09 (cc) <paul4hough@gmail.com>

(ert-deftest test-timestamp ()
  "validate timestamp function"
  (should (load-file "../../src/pah-misc/timestamp.el"))
  (should (eql (string-match
		(concat "^[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]"
			" [0-2][0-9]:[0-5][0-9]$")
		(timestamp)) 0)))
