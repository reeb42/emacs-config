;;
;; m_gnus.el for emacs in /
;;
;; Made by CUISSARD Vincent
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 17:46:42 2004 CUISSARD Vincent
;; Last update Fri Jan 16 17:46:42 2004 CUISSARD Vincent
;;

(setq gnus-optional-headers (function gnus-optional-lines-and-name))

(defun gnus-optional-lines-and-name (header)
  "Return a string like `NNN:NAME' from HEADER."
  (let ((name-length 20)
        (from (nntp-header-from header))
        (name "\\([^ \"$&@][^$&@^]+[^ \"$&@]\\)"))
    (substring
     (format "%3d %s"
	     (nntp-header-lines header)
	     (concat (cond
                      ((string-match (concat "( *\"? *" name " *\"? *)") from)
                       (substring from (match-beginning 1) (match-end 1)))
                      ((string-match (concat "^ *\"? *" name " *\"? *<") from)
		       (substring from (match-beginning 1) (match-end 1)))
                      ((string-match (concat "<? *" name "@") from)
                       (substring from (match-beginning 1) (match-end 1)))
                      ((string-match (concat "!" name "\\( \\|$\\)") from)
                       (substring from (match-beginning 1) (match-end 1)))
                      (t (mail-strip-quoted-names from)))
                     (make-string name-length ? )))
     0 (+ 4 name-length))))

(setq gnus-ignored-headers
      "^\\(To\\|Cc\\|Originator\\|Keywords\\|Path\\|Posting-Version\\|Article-I.D.\\|Expires\\|Date-Received\\|References\\|Control\\|Xref\\|Lines\\|Posted\\|Relay-Version\\|Message-ID\\|Nf-ID\\|Nf-From\\|Approved\\|Sender\\|X-[^:]*\\|Distribution\\|NNTP-[^:]*\\|Distribution\\|Mime-[^:]*\\|Content-Type\\|Content-Transfer-Encoding\\|In-[Rr]eply-to\\|Reply-To\\|Followup-to\\|Xdisclaimer\\|Summary\\|Function\\):")

(setq gnus-local-distributions '("epita" "world"))
(setq gnus-local-domain "epita.fr")
(setq gnus-local-organization "Epita (French Computer Science school)")
(setq gnus-default-article-saver 'gnus-summary-save-in-file)
(setq gnus-article-save-directory "~/news" )
(setq gnus-kill-files-directory "~/news" )
(setq gnus-save-all-headers nil)
(setq gnus-uu-user-view-rules '(("jpeg$\\|jpg$\\|gif$" "xli")
				("au$\\|voc$\\|wav$" nil))
      gnus-uu-do-not-unpack-archives t
      gnus-uu-view-and-save       t
      gnus-uu-asynchronous        t
      gnus-uu-ask-before-view     t
      )

(provide 'gnus-optional-lines-and-name )
