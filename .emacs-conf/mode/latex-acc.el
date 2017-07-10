;;; iso-acc.el -- minor mode providing electric accent keys
;;; Copyright (C) 1993, 1994 Free Software Foundation, Inc.

;; If you want only some of these characters to serve as accents,
;; set iso-accents-enable to the list of characters that should be special.

;;; Code:"

(provide 'latex-acc)

(defvar latex-accents-list
  '(
    ((?' ?A) "\\'{A}")
    ((?' ?a) "\\'{a}")
    ((?' ?u) "\\'{u}")
    ((?' ?U) "\\'{U}")
    ((?` ?A) "\\`{A}")
    ((?` ?a) "\\`{a}")
    ((?^ ?A) "\\^{A}")
    ((?^ ?a) "\\^{a}")
    ((?^ ?o) "\\^{o}")
    ((?^ ?i) "\\^{i}")
    ((?\" ?A) "\\\"{A}")
    ((?\" ?a) "\\\"{a}")
    ((?' ?E) "\\'{E}")
    ((?' ?e) "\\'{e}")
    ((?` ?E) "\\`{E}")
    ((?` ?e) "\\`{e}")
    ((?` ?u) "\\`{u}")
    ((?` ?U) "\\`{U}")
    ((?^ ?E) "\\^{E}")
    ((?^ ?e) "\\^{e}")
    ((?\" ?E) "\\\"{E}")
    ((?\" ?e) "\\\"{e}")
    ((?\" ?i) "\\\"{i}")
    ((?\~ ?c) "\\\c{c}")
    ((?' ? ) "'")
    ((?^ ? ) "^")
    ((?` ? ) "`")
    ((?\" ? ) "\"")
    ((?~ ? ) "~")
    )
  "Association list for ISO accent combinations.")
(defvar latex-accents-minor-mode nil
  "*Non-nil enables ISO Accents mode.
Setting this variable makes it local to the current buffer.
See `latex-accents-mode'.")
(make-variable-buffer-local 'latex-accents-minor-mode)

(defun latex-accents-accent-key (prompt)
  "Modify the following character by adding an accent to it."
  ;; Pick up the accent character.
  (if latex-accents-minor-mode
      (latex-accents-compose prompt)
    (char-to-string last-input-char)))

(defun latex-accents-compose-key (prompt)
  "Modify the following character by adding an accent to it."
  ;; Pick up the accent character.
  (let ((combined (latex-accents-compose prompt)))
    (if unread-command-events
	(let ((unread unread-command-events))
	  (setq unread-command-events nil)
	  (error "Characters %s and %s cannot be composed"
		 (single-key-description (aref combined 0))
		 (single-key-description (car unread)))))
    combined))

(defun latex-accents-compose (prompt)
  (let* ((first-char last-input-char)
	 ;; Wait for the second key and look up the combination.
	 (second-char (if (or prompt
			      (not (eq (key-binding "a")
				       'self-insert-command)))
			  (progn
			    (message "%s%c"
				     (or prompt "Compose with ")
				     first-char)
			    (read-event))
			(insert first-char)
			(prog1 (read-event)
			  (delete-region (1- (point)) (point)))))
	 (entry (assoc (list first-char second-char) latex-accents-list)))
    (if entry
	;; Found it: delete the first character and insert the combination.
	(vector entry)
      ;;(concat (list (nth 1 entry))) 
      ;; Otherwise, advance and schedule the second key for execution.
      (setq unread-command-events (list second-char))
      (vector first-char))))

(defvar latex-accents-enable '(?' ?` ?^ ?\" ?~ ?/)
  "*List of accent keys that become prefixes in ISO Accents mode.
The default is (?' ?` ?^ ?\" ?~ ?/), which contains all the supported
accent keys.  For certain languages, you might want to remove some of
those characters that are not actually used.")

(or key-translation-map (setq key-translation-map (make-sparse-keymap)))
;; For sequences starting with an accent character,
;; use a function that tests latex-accents-minor-mode.
(if (memq ?' latex-accents-enable)
    (define-key key-translation-map "'"  'latex-accents-accent-key))
(if (memq ?` latex-accents-enable)
    (define-key key-translation-map "`"  'latex-accents-accent-key))
(if (memq ?^ latex-accents-enable)
    (define-key key-translation-map "^"  'latex-accents-accent-key))
(if (memq ?\" latex-accents-enable)
    (define-key key-translation-map "\"" 'latex-accents-accent-key))
(if (memq ?~ latex-accents-enable)
    (define-key key-translation-map "~" 'latex-accents-accent-key))
(if (memq ?/ latex-accents-enable)
    (define-key key-translation-map "/" 'latex-accents-accent-key))

;; It is a matter of taste if you want the minor mode indicated
;; in the mode line...
;; If so, uncomment the next four lines.
;; (or (assq 'latex-accents-minor-mode minor-mode-map-alist)
;;     (setq minor-mode-alist
;; 	  (append minor-mode-alist
;; 		  '((latex-accents-minor-mode " Latex-Acc")))))

;;;###autoload
(defun latex-accents-mode (&optional arg)
  "Toggle ISO Accents mode, in which accents modify the following letter.
This permits easy insertion of accented characters according to ISO-8859-1.
When latex-accents mode is enabled, accent character keys
\(`, ', \", ^, / and ~) do not self-insert; instead, they modify the following
letter key so that it inserts an ISO accented letter.

The variable `latex-accents-enable' specifies the list of characters to
enable as accents.  If you don't need all of them, remove the ones you
don't need from that list.

Special combinations: ~c gives a c with cedilla,
~d gives a d with dash.
\"s gives German sharp s.
/a gives a with ring.
/e gives an a-e ligature.
~< and ~> give guillemets.

With an argument, a positive argument enables ISO Accents mode, 
and a negative argument disables it."

  (interactive "P")

  (if (if arg
	  ;; Negative arg means switch it off.
	  (<= (prefix-numeric-value arg) 0)
	;; No arg means toggle.
	latex-accents-minor-mode)
      (setq latex-accents-minor-mode nil)

    ;; Enable electric accents.
    (setq latex-accents-minor-mode t)))

;;; latex-acc.el ends here

