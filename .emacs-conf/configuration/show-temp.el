;;
;; show-temp.el for emacs in /
;;
;; Made by CUISSARD Vincent
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 17:46:10 2004 CUISSARD Vincent
;; Last update Fri Jan 16 17:46:11 2004 CUISSARD Vincent
;;

(defun is-output-buffer (buf list)
  (if list
      (if (eq (process-buffer (car list)) buf)
          t
	(is-output-buffer buf (cdr list)))))

(defun show-temp-buffer (buffer)
  "Display BUFFER on the screen in a window of appropriate size.  Will
not give a window of size greater than temp-buffer-max-height."
  (let* ((temp-buffer-max-height (/ (- (frame-height) 2) 2))
         (current-window (selected-window))
         (window (display-buffer buffer))
         (window-lines (window-height window))
         ;; Check if we can safely resize this window
         (minibuffer-line (nth 1 (window-edges (minibuffer-window))))
         (window-edges (window-edges window))
         (minibuffer-safe (not (and (= (nth 1 window-edges) 0)
                                    (= (nth 3 window-edges)
                                       minibuffer-line))))
         window-lines-needed)
    ;; Ensure sane initial window configuration
    (setq minibuffer-scroll-window window)
    (set-window-start window 1)
    (set-window-point window 1)
    (set-window-hscroll window 0)
    (save-excursion
      (set-buffer buffer)
      (goto-char (point-min))
      ;; Delete leading blank lines
      (if (looking-at "\n+")
          (let ((buffer-read-only nil)
                (buffer-modified-p (buffer-modified-p)))
            (replace-match "")
            (set-buffer-modified-p buffer-modified-p)))
      ;; Calculate vertical lines needed by text
      (setq window-lines-needed
            (+ 1 (vertical-motion (- temp-buffer-max-height 2))
               (if (bolp) 0 1))))
    (cond (minibuffer-safe
           ;; Make sure the window isn't too small
           (setq window-lines-needed
                 (if (< window-lines-needed window-min-height)
                     window-min-height
                   window-lines-needed))
	   (if (or
		(string-match "compilation" (buffer-name buffer))
		(is-output-buffer buffer (process-list)))
	       (setq window-lines-needed (max window-lines-needed (/ (- (frame-height) 2) 4))))

           ;; Do the resize operation
           (select-window window)
           (enlarge-window (- window-lines-needed window-lines))
           (select-window current-window)))))
