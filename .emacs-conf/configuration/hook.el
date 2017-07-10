;;
;; hook.el for emacs in /
;;
;; Made by CUISSARD Vincent
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 16:23:59 2004 CUISSARD Vincent
;; Last update Fri Sep 08 09:08:04 2006 Vincent CUISSARD
;;

(add-hook 'c-mode-hook
	  '(lambda ()
	     ('write-file-hooks 'delete-trailing-whitespace)
	     ))

(add-hook 'c-mode-hook
	  '(lambda ()
	     (auto-indentation-mode 1)
	     ))

(add-hook 'ada-mode-hook
	  '(lambda ()
	     (auto-indentation-mode 1)
	     ))
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (auto-indentation-mode 1)
	     (set-variable (quote compile-command) "gmake ")
	     ))

(add-hook 'text-mode-hook
	  '(lambda ()
	     (auto-fill-mode 1)
	     ) )
(add-hook 'html-mode-hook
	  '(lambda ()
	     (html-accents-mode t)
	     ) )

(add-hook 'latex-mode-hook
	  '(lambda ()
	     (latex-accents-mode t)
	     (set-variable (quote compile-command) "latex ")
	     ) )

(add-hook 'gnus-startup-hook
	  '(lambda ()
	     (require  'gnus-optional-lines-and-name "m_gnus") ))

(add-hook 'c-mode-hook 'fp-c-mode-routine)
(add-hook 'c++-mode-hook 'fp-c-mode-routine)
(add-hook 'perl-mode-hook 'fp-c-mode-routine)
(add-hook 'cperl-mode-hook 'fp-c-mode-routine)

(add-hook 'c-mode-hook        'flyspell-prog-mode 1)
(add-hook 'c++-mode-hook      'flyspell-prog-mode 1)
(add-hook 'sh-mode-hook       'flyspell-prog-mode 1)
(add-hook 'makefile-mode-hook 'flyspell-prog-mode 1)


(defun fp-c-mode-routine ()
  (local-set-key "\M-q" 'rebox-comment))
(autoload 'rebox-comment "rebox" nil t)
(autoload 'rebox-region "rebox" nil t)

