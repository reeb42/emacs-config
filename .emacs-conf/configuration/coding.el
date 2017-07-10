;;
;; coding.el
;;
;; Made by (CUISSARD Vincent)
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 15:29:19 2004 CUISSARD Vincent
;; Last update Fri Sep 08 08:35:16 2006 Vincent CUISSARD
;;

;; Create my own coding style
;; No space before { and function sig indents 4 if argument overflow

(setq reeb-c-style
      '((c-basic-offset                 . 2)
        (c-comment-only-line-offset     . 0)
        (c-echo-syntactic-information-p . nil)
        (c-hungry-delete-key            . t)
        (c-toggle-hungry-state          . t)
        (c-hanging-braces-alist         . ((substatement-open after)
                                          (brace-list-open)))
        (c-offsets-alist                . ((arglist-close . c-lineup-arglist)
                                           (case-label . 2)
                                           (substatement-open . 0)
                                           (block-open . 0)
                                           (knr-argdecl-intro . -)))
        (c-hanging-colons-alist         . ((member-init-intro before)
                                           (inher-intro)
                                           (case-label after)
                                           (label after)
                                           (access-label after)))
        (c-cleanup-list                 . (scope-operator
                                           empty-defun-braces
                                           defun-close-semi))))

(setq reeb-c++-style
      '(
        (c++-basic-offset                 . 2)
        (c++-comment-only-line-offset     . 0)
        (c++-echo-syntactic-information-p . nil)
        (c++-hungry-delete-key            . t)
        (c++-toggle-hungry-state          . t)
        (c++-hanging-braces-alist         . ((substatement-open after)
                                          (brace-list-open)))
        (c++-offsets-alist                . ((arglist-close . c-lineup-arglist)
                                           (case-label . 2)
                                           (substatement-open . 0)
                                           (block-open . 0)
                                           (knr-argdecl-intro . -)))
        (c++-hanging-colons-alist         . ((member-init-intro before)
                                           (inher-intro)
                                           (case-label after)
                                           (label after)
                                           (access-label after)))
        (c++-cleanup-list                 . (scope-operator
                                           empty-defun-braces
                                           defun-close-semi))))


;; Construct a hook to be called when entering C mode
(defun lconfig-c-mode ()
  (progn (define-key c-mode-base-map "\C-m" 'newline-and-indent)
	 (define-key c-mode-base-map "\M-n" 'epita-check_coding-style)
         (define-key c-mode-base-map [f1] 'cvs-update)
         (define-key c-mode-base-map [f2] 'cvs-do-commit)
         (define-key c-mode-base-map [f3] 'cvs-status)
         (define-key c-mode-base-map [f5] 'next-error)
         (define-key c-mode-base-map [f6] 'run-program)
         (define-key c-mode-base-map [f7] 'compile)
         (define-key c-mode-base-map [f8] 'set-mark-command)
         (define-key c-mode-base-map [f9] 'insert-breakpoint)
         (define-key c-mode-base-map [f10] 'step-over)
         (define-key c-mode-base-map [f11] 'step-into)
         (define-key c-mode-base-map [tab] "\M-i")
         (c-add-style "ReeB's Coding Style" reeb-c-style t)))

(defun lconfig-c++-mode ()
  (progn (define-key c++-mode-base-map "\C-m" 'newline-and-indent)
         (define-key c++-mode-base-map [f1] 'cvs-update)
         (define-key c++-mode-base-map [f2] 'cvs-status)

         (define-key c++-mode-base-map [f5] 'next-error)
         (define-key c++-mode-base-map [f6] 'run-program)
         (define-key c++-mode-base-map [f7] 'compile)
         (define-key c++-mode-base-map [f8] 'set-mark-command)
         (define-key c++-mode-base-map [f9] 'insert-breakpoint)
         (define-key c++-mode-base-map [f10] 'step-over)
         (define-key c++-mode-base-map [f11] 'step-into)
         (c++-add-style "ReeB's Coding Style" reeb-c++-style t)))

(add-hook 'c-mode-common-hook 'lconfig-c-mode)
(add-hook 'c++-mode-common-hook 'lconfig-c++-mode)

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-set-style "K&R")
  (setq indent-tabs-mode 1)
  (setq c-basic-offset 8))
