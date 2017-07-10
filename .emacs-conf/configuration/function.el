;;
;; function.el for emacs in /
;;
;; Made by CUISSARD Vincent
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 13:14:29 2004 CUISSARD Vincent
;; Last update Wed Feb 08 09:41:22 2006 Vincent CUISSARD
;;

(defun cl ()
  (interactive)
  (load "clearcase")
  )

 (defun justify-line ()
  (interactive)
  (justify-current-line)
  (next-line 1)
  )

(defun line-comment ()
  "Comment the current line \n Mode available C , Emacs-lisp ,Fundamental"
  (interactive)
  (beginning-of-line)
  ( cond
    ((string-equal "C" mode-name )
     (insert-string "/*")
     (end-of-line)
     (insert-string "*/"))
    ((string-equal "tuareg" mode-name )
     (insert-string "(*")
     (end-of-line)
     (insert-string "*)"))
    ((string-equal "Emacs-Lisp" mode-name)
     (insert-string ";;"))
    ((string-equal "LaTeX" mode-name)
     (insert-string "%%"))
    ((string-equal "C++" mode-name)
     (insert-string "//"))
    ((string-equal "perl" mode-name)
     (insert-string "#"))
    ((string-equal "python" mode-name)
     (insert-string "#"))
    ((string-equal "Ada" mode-name)
     (insert-string "--"))
    ((or (string-equal "Fundamental" mode-name)
	 (string-equal "TCL" mode-name)
	 (string-equal "sh"  mode-name)
	 (string-equal "Makefile"  mode-name))
     (insert-string "#"))
    )
  (next-line 1)
  (beginning-of-line)
  )

(defun un-line-comment ()
  "Uncomment the current line \n Mode available C , Emacs-lisp ,Fundamental"
  (interactive)
  (beginning-of-line)
  (cond
   ((string-equal "C" mode-name )
    (search-forward "/*")
    (delete-backward-char 2 nil)
    (indent-according-to-mode)
    (search-forward "*/")
    (delete-backward-char 2 nil))
   ((string-equal "tuareg" mode-name )
    (search-forward "(*")
    (delete-backward-char 2 nil)
    (indent-according-to-mode)
    (search-forward "*)")
    (delete-backward-char 2 nil))
   ((string-equal "Emacs-Lisp" mode-name)
    (search-forward ";;")
    (delete-backward-char 2 nil))
   ((string-equal "LaTeX" mode-name)
    (search-forward "%%")
    (delete-backward-char 2 nil))
   ((string-equal "C++" mode-name)
    (search-forward "//")
    (delete-backward-char 2 nil))
   ((string-equal "perl" mode-name)
    (search-forward "#")
    (delete-backward-char 2 nil))
   ((string-equal "python" mode-name)
    (search-forward "#")
    (delete-backward-char 2 nil))
   ((string-equal "Ada" mode-name)
    (search-forward "--")
    (delete-backward-char 2 nil))
   ((or (string-equal "Fundamental" mode-name)
	(string-equal "TCL" mode-name)
	(string-equal "sh" mode-name)
	(string-equal "Makefile"  mode-name))
    (search-forward "#")
    (delete-backward-char 1 nil))
   )
  (indent-according-to-mode)
  (next-line 1)
  )

(defun delete-line-and-indent ()
  (interactive)
  (kill-line)
  (indent-according-to-mode)
  )

(defun set-default-colors()
  "Put my own colors at screen .faucil_t@epita.fr"
  (interactive)
  (set-mouse-color "white")
  (set-face-background 'modeline "white")
  (set-face-foreground 'modeline "black")
  (if (x-display-color-p)
      (progn
	(set-foreground-color foreground-color)
	(set-background-color background-color)
	)
    (set-background-color "black")
    (set-foreground-color "white")
    (set-border-color "white")
    )
  (set-default-font my_font)
  (set-cursor-color "black"))

(defun open-new-frame()
  "Create new frame with good apparence"
  (interactive)
  (make-frame)
  (other-frame 1)
  (set-default-colors))


(defun new-buffer-frame (buffer)
  "Switch to buffer BUFFER in another frame with defaults colors"
  (interactive "BSwitch to buffer in other frame: ")
  (let ((pop-up-frames t))
    (pop-to-buffer buffer t)
    (raise-frame (window-frame (selected-window))))
  (set-default-colors))
(defun end-of-code-line () "goes to end of code on line"
  (interactive)
  (if (eq last-command this-command)
      (end-of-line)
    (let ((comment-start
	   (or (cdr (assoc mode-name
			   '(("C++" . "/[/*]")
			     ("C" . "/\\*")
			     ("Emacs-Lisp" . ";")
			     ;; put other stuff here
			     )))
	       ""))
	  (bol (progn (beginning-of-line) (point))))
      (end-of-line)
      (while (re-search-backward comment-start bol t))
      (re-search-backward "\\S-" nil t)
      (forward-char 1))))
;;;	CIS Dept, Ohio State University			w/ (614) 292-8501
;;;	774 Dreese, 2015 Neil Ave.			h/ (614) 791-1347
;;;	Columbus, OH 43210		http://www.cis.ohio-state.edu/~ware
;;;
;;; This file provides functions that automatically scroll the window
;;; horizontally when the point moves off the left or right side of
;;; the window.  To enable, the variable truncate-lines must be
;;; non-nil -- truncate-lines becomes buffer-local whenever it is set..
;;; This causes long lines to disappear off the end of the screen instead of
;;; wrapping to the beginning of the next line.  To cause this to be the
;;; default for all buffers and to load this package, add the following lines
;;; to your .emacs (sans ;;;):
;;;
;;; (setq default-truncate-lines t)
;;; (require 'auto-show)

;;; I've found that I only want this when I'm editing C code.  Accordingly
;;; I have something like the following in my .emacs:
;;;
;;; (load-library "auto-show")
;;; (defun my-c-mode-hook ()
;;;   "Run when C-mode starts up.  Changes the comment column to be 40"
;;;   ... set various personal preferences ...
;;;   (setq truncate-lines t))
;;; (add-hook 'c-mode-hook 'my-c-mode-hook)

(provide 'auto-show)
(add-hook 'post-command-hook 'auto-show-make-point-visible)
(defvar auto-show-shift-amount 8
  "extra amount to shift a line when point is not visible")

(defun auto-show-truncationp ()
  "True if truncation is on for current window"
  (or truncate-lines
      (and truncate-partial-width-windows
	   (< (window-width) (frame-width)))))

(defun auto-show-make-point-visible ()
  "Scrolls the screen horizontally to make point visible"
  (interactive)
  (if (auto-show-truncationp)
      (progn
	(let ((col (current-column))	;column on line point is at
	      (scroll (window-hscroll))	;how far window is scrolled
	      (w-width (- (window-width)
			  (if (> (window-hscroll) 0)
			      2 1))))	;how wide window is on the screen
	  (if (< col scroll)		;to the left of the screen
	      (scroll-right (+ (- scroll col) auto-show-shift-amount))
	    (if (>= col (+ scroll w-width)) ;to the right of the screen
		(scroll-left (+ auto-show-shift-amount
				(- col (+ scroll w-width))))))))))

(defun func-comment ()
  "Puts a standard header at the top of a function.\n"
  (interactive)
  (setq funcname (read-from-minibuffer
		  (format "Function name : ")))
  (insert-string (std-get 'cs))
  (newline)
  (insert-string (concat (std-get 'cc)
			 "Function: "
			 funcname))
  (newline)
  (insert-string (concat (std-get 'cc)
			 "Input: "))
  (newline)
  (insert-string (concat (std-get 'cc)
			 "Output: "))
  (newline)
  (insert-string (concat (std-get 'cc)
			 "Comments: "))
  (newline)
  (insert-string (std-get 'ce))
  (newline))

(defun insert-gpl ()
  "Insert standard GPL header."
  (interactive)
  (setq pname (read-from-minibuffer
		  (format "Type Program name : ")))
  (interactive)
  (setq pdesc (read-from-minibuffer
		  (format "Description : ")))

  (insert-string "/*
** ")
  (insert-string (concat pname " - " pdesc))
(insert-string "
** Copyright (C) 2004 CUISSARD Vincent
**
** This program is free software; you can redistribute it and/or
** modify it under the terms of the GNU General Public License
** as published by the Free Software Foundation; either version 2
** of the License, or (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program; if not, write to the Free Software
** Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/")
(newline)
)

(defun next-buffer ()
  "Switch to the next buffer in cyclic order."
  (interactive)
  (let ((buffer (current-buffer)))
    (switch-to-buffer (other-buffer buffer))
    (bury-buffer buffer)))

(defun prev-buffer ()
  "Switch to the previous buffer in cyclic order."
  (interactive)
  (let ((list (nreverse (buffer-list)))
	found)
    (while (and (not found) list)
      (let ((buffer (car list)))
	(if (and (not (get-buffer-window buffer))
		 (not (string-match "\\` " (buffer-name buffer))))
	    (setq found buffer)))
      (setq list (cdr list)))
    (switch-to-buffer found)))

