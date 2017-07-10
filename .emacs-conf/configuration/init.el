;;
;; init.el
;;
;; Made by (CUISSARD Vincent)
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 13:09:04 2004 CUISSARD Vincent
;; Last update Fri Sep 08 08:25:15 2006 Vincent CUISSARD
;;

(setq force-block-preference-to-all-modes nil)
(setq block-preference nil)
(setq backup-by-copying-when-mismatch t)
(setq backup-by-copying-when-linked t)

(setq c-argdecl-indent 0)
(setq c-argdecl-offset 2)
(setq c-brace-imaginary-offset 0)
(setq c-brace-offset -2)
(setq c-continued-brace-offset 0)
(setq c-continued-statement-offset 2)
(setq c-indent-level 2)
(setq c-label-offset -2)

(setq default-fill-column 79)

(setq dired-listing-switches "-lagq")
(setq lpr-command "lpr")
(setq lpr-switches ( quote ("-P5")))
(setq shell-file-name "/bin/sh")
(set-default 'case-fold-search nil)	;;voir auto-template
(setq scroll-step 1)
(setq window-min-height 1)
(setq window-min-width 1)
(setq inhibit-startup-message t)
(setq display-time-day-and-date t)
(set-variable (quote compile-command) "make ")
(setq default-major-mode 'fundamental-mode)

(setq user-nickname (user-full-name))
(put 'eval-expression 'disabled nil)
(setq auto-save-list-file-name nil)

(setq mail-yank-prefix "> ")
(setq mail-header-separator "--Please type your text after this line--")

(setq my_msg " configuration complete")
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
