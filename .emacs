;;
;; .emacs for emacs in /
;;
;; Made by CUISSARD Vincent
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 17:50:02 2004 CUISSARD Vincent
;; Last update Fri Sep 08 09:02:20 2006 Vincent CUISSARD
;;

(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;; Personal infos
(load "~/.emacs-conf/personal")

;; Load and init Emacs

;; retour chariots au format Windows
;;(setq default-buffer-file-coding-system 'no-conversion-dos)
;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

(setq load-path
      (cons (expand-file-name "~/.emacs-conf/configuration") load-path))
(setq load-path
      (cons (expand-file-name "~/.emacs-conf/mode") load-path))
(setq auto-template-dir "~/.emacs-conf/templates")

(load "init")            ;; Init library...
(load "keydefs")	 ;; Bindkeys definition...
(load "auto")	         ;; Load and init templates and autoload
(load "hook")		 ;; Hook definition...
(load "hilight")       	 ;; syntax highlight
(load "global-dabbrev")  ;; some functions
(load "coding")		 ;; coding style
(load "function")        ;; Functions definitions
(load "color-theme")     ;; Color theme

(color-theme-xemacs)

;; init
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(delete-selection-mode t)
(setq delete-auto-save-files t)
(cond ((not running-xemacs)
       (normal-erase-is-backspace-mode 1)
))

(global-auto-revert-mode t)

;; CVS init
(setenv "CVS_RSH" "/usr/bin/ssh")

;; Expand tar in live
(auto-compression-mode t)

;; no toolbar
;(menu-bar-mode nil)

;; Time in status
(display-time)
(setq display-time-24hr-format t)

;; European mode
;(standard-display-european t)

;; Column and line
(setq column-number-mode t)
(setq line-number-mode t)


;; Ortographe Correction
(defun ispell-check ()
  (interactive)
  (if mark-active
      (if (< (mark) (point))
	  (ispell-region (mark) (point))
	(ispell-region (point) (mark)))
    (ispell-buffer)))
(global-set-key [(control $)] `ispell-check)
(global-set-key [(meta $)] `ispell-word)
(global-set-key [(control meta $)] `ispell-change-dictionary)
(setq ispell-local-dictionary "english")

;; Pour les mails
(add-hook 'message-mode-hook 'iso-accents-mode)
(add-hook 'message-mode-hook 'auto-fill-mode)

(set-fill-column 80)

;; Mouse uses
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly) (defun up-one () (interactive)
(scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [(shift mouse-4)] 'down-one)
(global-set-key [(shift mouse-5)] 'up-one) (defun up-a-lot () (interactive)
(scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [(control mouse-4)] 'down-a-lot)
(global-set-key [(control mouse-5)] 'up-a-lot)

(setq minibuffer-max-depth nil)
