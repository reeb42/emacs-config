;;
;; personal.el
;;
;; Made by (CUISSARD Vincent)
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Thu Jan 15 06:30:10 2004 CUISSARD Vincent
;; Last update Fri Jan 16 13:26:28 2004 CUISSARD Vincent
;;

(setq user-login-name "vcuissar")
(setq user-fullname "Vincent Cuissard")
(setq user-full-name "Vincent Cuissard")
(setq user-nickname "reeb")
(setq user-mail-address "vincent.cuissard@gmail.com")
(setq tpl-user-name "vcuissar")
(setq tpl-user-login "vcuissar")
(setq next-line-add-newlines nil)

(global-font-lock-mode t)
;; Hilight selection
(transient-mark-mode t)
;; Matching bracket
(show-paren-mode 1)
(setq-default hilight-paren-expression t)     

(custom-set-variables
 '(paren-mode (quote blink-paren) nil (paren))
 '(line-number-mode t)
 '(font-lock-mode t nil (font-lock)))


(setq font-lock-use-default-fonts t)
(setq font-lock-use-default-colors t)
(setq font-lock-maximum-decoration t)
