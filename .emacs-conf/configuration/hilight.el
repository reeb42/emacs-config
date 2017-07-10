;;
;; hilight.el for emacs in /
;;
;; Made by CUISSARD Vincent
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 14:33:03 2004 CUISSARD Vincent
;; Last update Fri Sep 08 08:53:10 2006 Vincent CUISSARD
;;

(cond ((not running-xemacs) 
       (global-font-lock-mode t)
       ;; Hilight selection
       (transient-mark-mode t)
       ;; Matching bracket
       (show-paren-mode 1)
       (setq-default hilight-paren-expression t)     
       ))

(custom-set-variables
 '(paren-mode (quote blink-paren) nil (paren))
 '(line-number-mode t)
 '(font-lock-mode t nil (font-lock)))


(setq font-lock-use-default-fonts t)
(setq font-lock-use-default-colors t)
(setq font-lock-maximum-decoration t)

;(custom-set-faces
; '(default ((t (:family "Courier New" :foreground "grey89" :background "black" :size "10pt"))) t)
; '(font-lock-default-face ((t (:foreground "black" :background "black"))))
; '(font-lock-comment-face ((t (:foreground "purple1" :background "black"))))
; '(font-lock-string-face ((t (:foreground "magenta" :background "black"))))
; '(font-lock-keyword-face ((t (:foreground "yellow3" :background "black"))))
; '(font-lock-warning-face ((t (:foreground "PaleVioletRed3" :background "black"))))
; '(font-lock-constant-face ((t (:foreground "BlueViolet" :background "black"))))
; '(font-lock-type-face ((t (:foreground "CornFlowerBlue" :background "black"))))
; '(font-lock-variable-name-face ((t (:foreground "PaleGreen" :background "black"))))
; '(font-lock-function-name-face ((t (:foreground "magenta1" :background "black" :underline t))))
; '(font-lock-builtin-face ((t (:foreground "green" :background "black"))))
; '(font-lock-preprocessor-face ((t (:foreground "CadetBlue" :background "black"))))
;)
