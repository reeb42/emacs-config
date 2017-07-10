;;
;; html-acc.el
;; 
;; Made by (thierry faucille)
;; Login   <faucil_t@epita.fr>
;; 
;; Started on  Wed May  8 09:59:31 1996 thierry faucille
;; Last update Thu Oct  3 18:22:56 1996 thierry faucille
;;
(defvar html-accents-list
  '(
    ((?' ?A) "&Aacute;")
    ((?' ?a) "&aacute;")
    ((?' ?E) "&Eacute;")
    ((?' ?e) "&eacute;")
    ((?' ?O) "&Oacute;")
    ((?' ?o) "&oacute;")
    ((?' ?U) "&Uacute;")
    ((?' ?u) "&uacute;")
    ((?' ?I) "&Iacute;")
    ((?' ?i) "&iacute;")
    ((?' ? ) "'")
    ((?^ ?A) "&Acirc;")
    ((?^ ?a) "&acirc;")
    ((?^ ?E) "&Ecirc;")
    ((?^ ?e) "&ecirc;")
    ((?^ ?O) "&Ocirc;")
    ((?^ ?o) "&ocirc;")
    ((?^ ?U) "&Ucirc;")
    ((?^ ?u) "&ucirc;")
    ((?^ ?I) "&Icirc;")
    ((?^ ?i) "&icirc;")
    ((?^ ? ) "^")
    ((?` ?A) "&Agrave;")
    ((?` ?a) "&agrave;")
    ((?` ?E) "&Egrave;")
    ((?` ?e) "&egrave;")
    ((?` ?O) "&Ograve;")
    ((?` ?o) "&ograve;")
    ((?` ?U) "&Ugrave;")
    ((?` ?u) "&ugrave;")
    ((?` ?I) "&Igrave;")
    ((?` ?i) "&igrave;")
    ((?` ? ) "`")
    ((?\" ?A) "&Auml;")
    ((?\" ?a) "&auml;")
    ((?\" ?E) "&Euml;")
    ((?\" ?e) "&euml;")
    ((?\" ?O) "&Ouml;")
    ((?\" ?o) "&ouml;")
    ((?\" ?U) "&Uuml;")
    ((?\" ?u) "&uuml;")
    ((?\" ?I) "&Iuml;")
    ((?\" ?i) "&iuml;")
    ((?\" ? ) "\"")
    ((?~ ?c) "&ccedil;")
    ((?~ ? ) "~")
    )
  "Association list for ISO accent combinations.")

(defvar html-accents-minor-mode nil
  "*Non-nil enables ISO Accents mode.
Setting this variable makes it local to the current buffer.
See `html-accents-mode'.")
(make-variable-buffer-local 'html-accents-minor-mode)

(defun html-accents-accent-key (prompt)
  "Modify the following character by adding an accent to it."
  ;; Pick up the accent character.
  (if html-accents-minor-mode
      (html-accents-compose prompt)
    (char-to-string last-input-char)))

(defun html-accents-compose-key (prompt)
  "Modify the following character by adding an accent to it."
  ;; Pick up the accent character.
  (let ((combined (html-accents-compose prompt)))
    (if unread-command-events
	(let ((unread unread-command-events))
	  (setq unread-command-events nil)
	  (error "Characters %s and %s cannot be composed"
		 (single-key-description (aref combined 0))
		 (single-key-description (car unread)))))
    combined))

(defun html-accents-compose (prompt)
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
	 (entry (assoc (list first-char second-char) html-accents-list)))
    (if entry
	;; Found it: delete the first character and insert the combination.
	(insert-string (car (cdr (assoc (list first-char second-char) html-accents-list))))
      ;;(concat (list (nth 1 entry))) 
      ;; Otherwise, advance and schedule the second key for execution.
      (setq unread-command-events (list second-char))
      (vector first-char))))

(defvar html-accents-enable '(?' ?` ?^ ?\" ?~ ?/)
  "*List of accent keys that become prefixes in ISO Accents mode.
The default is (?' ?` ?^ ?\" ?~ ?/), which contains all the supported
accent keys.  For certain languages, you might want to remove some of
those characters that are not actually used.")

(or key-translation-map (setq key-translation-map (make-sparse-keymap)))
;; For sequences starting with an accent character,
;; use a function that tests html-accents-minor-mode.
(if (memq ?' html-accents-enable)
    (define-key key-translation-map "'"  'html-accents-accent-key))
(if (memq ?` html-accents-enable)
    (define-key key-translation-map "`"  'html-accents-accent-key))
(if (memq ?^ html-accents-enable)
    (define-key key-translation-map "^"  'html-accents-accent-key))
(if (memq ?\" html-accents-enable)
    (define-key key-translation-map "\"" 'html-accents-accent-key))
(if (memq ?~ html-accents-enable)
    (define-key key-translation-map "~" 'html-accents-accent-key))
(if (memq ?/ html-accents-enable)
    (define-key key-translation-map "/" 'html-accents-accent-key))

;; It is a matter of taste if you want the minor mode indicated
;; in the mode line...
;; If so, uncomment the next four lines.
;; (or (assq 'html-accents-minor-mode minor-mode-map-alist)
;;     (setq minor-mode-alist
;; 	  (append minor-mode-alist
;; 		  '((html-accents-minor-mode " Html-Acc")))))

;;;###autoload
(defun html-accents-mode (&optional arg)
  "Toggle ISO Accents mode, in which accents modify the following letter.
This permits easy insertion of accented characters according to ISO-8859-1.
When html-accents mode is enabled, accent character keys
\(`, ', \", ^, / and ~) do not self-insert; instead, they modify the following
letter key so that it inserts an ISO accented letter.

The variable `html-accents-enable' specifies the list of characters to
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
	html-accents-minor-mode)
      (setq html-accents-minor-mode nil)
    
    ;; Enable electric accents.
    (setq html-accents-minor-mode t)))

;;; html-acc.el ends here

