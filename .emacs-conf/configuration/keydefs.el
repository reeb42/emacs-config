;;
;; keydefs.el for emacs in /
;;
;; Made by CUISSARD Vincent
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 13:32:54 2004 CUISSARD Vincent
;; Last update Fri Sep 08 08:42:13 2006 Vincent CUISSARD
;;

;; change buffer
(global-set-key [(control tab)] `next-buffer)
(global-set-key [(control shift tab)] 'prev-buffer)

;;; Standard keys to delete
(define-key global-map [backspace] 'delete-backward-char)
(global-set-key "\C-h"           'delete-backward-char)
(global-set-key "\C-?"           'delete-backward-char)

;; Tags
(global-set-key "\C-x\C-t"	'tags-search)
;(global-set-key "\C-x\C-p"	'pop-tag-mark)

;; To change the position of the cursor

(global-set-key "\M-p"                  'backward-paragraph)
(global-set-key "\M-n"                  'forward-paragraph)
(global-set-key "\C-c\C-g"              'goto-line)
(global-set-key [(control left)]	'backward-word)
(global-set-key [(control right)]	'forward-word)
(global-set-key [(control up)]		'backward-sentence)
(global-set-key [(control down)]	'forward-sentence)
(global-set-key [(control shift right)] 'kill-word)
(global-set-key [(control shift left)]      'backward-kill-word)
(if window-system
    (progn
      (global-set-key [f5]  'open-new-frame);
      (global-set-key [f6]  'delete-frame);
      (global-set-key [f7]  'line-comment);
      (global-set-key [f8]  'un-line-comment);
      (global-set-key [f9] 'iconify-or-deiconify-frame)
      ))
;;;; The windows attributes
;(global-set-key "\M-+"           'enlarge-window)
;(global-set-key "\M--"           'shrink-window)
;(global-set-key "\M-*"           'enlarge-window-horizontally)
;(global-set-key "\M-/"           'shrink-window-horizontally)

;;;; frame definitions
(global-set-key "\C-x5b" 'new-buffer-frame)
(global-set-key "\C-x52" 'open-new-frame)

;;;; Utilities
(global-unset-key "\C-xf")

(global-set-key "\M-?"		'help-for-help)
(global-set-key "\C-ch"		'update-std-header)
(global-set-key "\C-c\C-h"	'std-file-header)
(global-set-key "\M-o"		'other-frame)

;;; Just for c-mode
(if (and (boundp 'emacs-version)
	 (or (and (boundp 'epoch::version) epoch::version)
	     (string-lessp emacs-version "19.29")))
    (define-key c-mode-map "\C-k" 'delete-line-and-indent)
  )
(global-set-key "\C-c\C-v"		'insert-std-vertical-comments)

;;
(define-key text-mode-map "\C-c\C-j" 'justify-line)

;;;; Emacs-Lisp specials

(emacs-lisp-mode)

(defun my-byte-compile-file ()
  (interactive)
  (byte-compile-file buffer-file-name))

(define-key emacs-lisp-mode-map "\C-c\C-c" 'eval-current-buffer)
(define-key emacs-lisp-mode-map "\C-cc"    'eval-defun)
(define-key emacs-lisp-mode-map "\C-c\C-e" 'my-byte-compile-file)

(global-set-key (quote "") (quote func-comment))
