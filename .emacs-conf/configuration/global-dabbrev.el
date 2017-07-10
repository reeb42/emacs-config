;;
;; global-dabbrev.el for emacs in /
;;
;; Made by CUISSARD Vincent
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 17:45:48 2004 CUISSARD Vincent
;; Last update Fri Jan 16 17:45:50 2004 CUISSARD Vincent
;;

(setq
 global-dabbrev-starting-point nil
 global-dabbrev-last-relative-position nil
 global-dabbrev-last-buffer-number nil
 global-dabbrev-last-abbrev nil
 global-dabbrev-last-expansion nil
 global-dabbrev-table nil
 )

(defun global-dabbrev-expand ()
  "Same object as dabbrev-expand, but :
- searches : - first in the current buffer,
               bidirectionnaly from nearest to farest point;
             - then in all other buffers.
- uppercase-bug fixed.
Roger B. J. Baron - november 25th, 1992."
  (interactive)
  (let ((here (point)) ; let's store the point we were called from
	pattern
	(expansion nil)
	)
    (save-excursion
      (if (and (eq last-command this-command)
	       global-dabbrev-last-relative-position)
	  (skip-chars-backward "^ \t\n.,;:'\"()[]{}+/=<>*&%$#@!?~`")

	;; let's get to the beginning of the string to expand :

	(if (= (point) here)
	    (error "There's nothing to expand here.")
	  )
	;; miscellaneous initialization before the first search :
	(setq global-dabbrev-starting-point (point)
	      global-dabbrev-abbrev (buffer-substring (point) here)
	      global-dabbrev-last-expansion global-dabbrev-abbrev
	      global-dabbrev-last-relative-position 0
	      global-dabbrev-last-buffer-number 0
	      global-dabbrev-table (cons global-dabbrev-abbrev nil)
	      )
	) ; if

      (setq pattern (concat "\\b"
			    (regexp-quote global-dabbrev-abbrev)
			    "\\(\\sw\\|\\s_\\|[-.>]\\)+"
			    )
	    )
      (let (buffer
	    (quit nil)
	    )

	(while (not (or quit expansion))
	  (setq buffer (nth global-dabbrev-last-buffer-number
			    (buffer-list)
			    )
		)

	  (if (null buffer)
	      (setq quit t)
	    (set-buffer buffer)

	    (if (= global-dabbrev-last-buffer-number 0)
		(let ((forward-expansion nil)
		      (backward-expansion nil)
		      backward-start
		      backward-end
		      forward-start
		      forward-end
		      (distance
		       (if (< global-dabbrev-last-relative-position 0)
			   (- global-dabbrev-last-relative-position)
			 global-dabbrev-last-relative-position
			 )
		       )
		      )

		  ;; search backward :
		  (goto-char global-dabbrev-starting-point)
		  (condition-case ()
		      (backward-char distance)
		    (error nil)
		    )

		  (setq backward-expansion
			(global-dabbrev-search pattern t
					       global-dabbrev-table))
		  (if backward-expansion
		      (progn
			(setq backward-start (point) )
			(search-forward backward-expansion)
			(setq backward-end (point))
			)
		    )

		  ;; search forward :
		  (goto-char here)
		  (condition-case ()
		      (forward-char distance)
		    (error nil)
		    )
		  (setq forward-expansion
			(global-dabbrev-search pattern nil
					       global-dabbrev-table))
		  (if forward-expansion
		      (progn
			(setq forward-end (point) )
			(search-backward forward-expansion)
			(setq forward-start (point))
			)
		    )

		  (setq expansion
			(cond
			 ( (not forward-expansion)
			   backward-expansion
			   )

			 ( (not backward-expansion)
			   forward-expansion
			   )

			 ( (= (- global-dabbrev-starting-point backward-end)
			      (- forward-start here))
			   (if (< global-dabbrev-last-relative-position
				  0)
			       forward-expansion
			     backward-expansion
			     )
			   )

			 ( (< (- global-dabbrev-starting-point backward-end)
			      (- forward-start here))
			   backward-expansion
			   )
			 ( t forward-expansion )
			 ) ; cond
			) ; setq expansion

		  (if expansion
		      (setq global-dabbrev-last-relative-position
			    (if (eq expansion backward-expansion)
				(- global-dabbrev-starting-point backward-end)
			      (- forward-start here)
			      )
			    ) ; setq last-relative-position
		    ) ; if
		  ) ; let forward-expansion...

	      ;; search in an other buffer (forward only) :

	      (goto-char global-dabbrev-last-relative-position)
	      (setq expansion (global-dabbrev-search pattern nil
						     global-dabbrev-table) )
	      (if expansion
		  (progn (search-backward expansion)
			 (setq global-dabbrev-last-relative-position (point))
			 )
		);if

	      ) ; if buffer-number...

	    (if (not expansion)
		(setq global-dabbrev-last-relative-position 0
		      global-dabbrev-last-buffer-number
		      (1+ global-dabbrev-last-buffer-number)
		      )
	      ) ; if
	    ) ; if null buffer...

	  ) ; while

	) ; let buffer...
      ); save-excursion

    (if (not expansion)
	(let ((first (string= global-dabbrev-abbrev
			      global-dabbrev-last-expansion
			      )
		     )
	      )
	  (setq global-dabbrev-last-relative-position nil) ;reset for next call
	  (message "4[%s]" first)
	  (if (not first)
	      ;; put back abbrev :
	      (progn (undo-boundary)
		     (delete-backward-char (length
					    global-dabbrev-last-expansion)
					   )
		     (insert global-dabbrev-abbrev)
		     )
	    );if
	  (error (if first
		     "No global dynamic expansion for \"%s\" found."
		   "No further global dynamic expansion for \"%s\" found.")
		 global-dabbrev-abbrev
		 ) ; error
	  ) ;  let

      ;; expansion found :

      (setq global-dabbrev-table (cons expansion global-dabbrev-table) )

      (goto-char here)
      (undo-boundary)
      ;; let's put back the original abbrev :
      (search-backward global-dabbrev-last-expansion)
      (replace-match global-dabbrev-abbrev t t)
      ;; now we can use replace-match to put the expansion found with the
      ;; good capitalization :
      (search-backward global-dabbrev-abbrev)
      (replace-match expansion nil t)

      (setq global-dabbrev-last-expansion expansion)
      ); if
    ); let
  ); defun


(defun global-dabbrev-search (pattern reverse table)
  (let ((missing nil)
	(result nil)
	)

    (while (and (not result)
		(not missing)
		)
      ;; look for it... leave loop if search fails.
      (setq missing (not (if reverse
			     (re-search-backward pattern nil t)
			   (re-search-forward pattern nil t)
			   )
			 )
	    )
      (if (not missing)
	  (progn (setq result (buffer-substring (match-beginning 0)
						(match-end 0)
						)
		       )
		 (let ((test table)
		       )
		   (while (and test
			       (not (string= (car test)
					     result
					     )
				    )
			       )
		     (setq test (cdr test) )
		     ); while
		   (if test (setq result nil)) ;already in table:ignore
		   );let
		 );progn
	) ; if
      ) ; while
    result
    ); let missing result
  ); defun global-dabbrev-search




