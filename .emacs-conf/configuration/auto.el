;;
;; template.el
;;
;; Made by (CUISSARD Vincent)
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Fri Jan 16 15:59:01 2004 CUISSARD Vincent
;; Last update Fri Sep 08 08:59:38 2006 Vincent CUISSARD
;;

;;  autoload

(setq load-path (cons "~/.emacs-conf/mode/tuareg-mode" load-path))
(setq load-path (cons "~/.emacs-conf/mode/" load-path))

(add-to-list 'load-path "~/.emacs-conf/mode/eieio")
(add-to-list 'load-path "~/.emacs-conf/mode/xslide")
(add-to-list 'load-path "~/.emacs-conf/mode/pgg")

;; Add clearcase module

;; XSL mode
(autoload 'xsl-mode "xslide" "Major mode for XSL stylesheets." t)

;; Turn on font lock when in XSL mode
(add-hook 'xsl-mode-hook
          'turn-on-font-lock)

(setq auto-mode-alist
      (append
       (list
        '("\\.fo" . xsl-mode)
        '("\\.xsl" . xsl-mode))
       auto-mode-alist))

;; Uncomment if using abbreviations
;; (abbrev-mode t)


(add-to-list 'load-path "~/.emacs-conf/mode/speedbar")

(autoload 'tiger-mode			"tiger-mode" nil t)
(autoload 'make-regexp			"make-regexp" nil t)
(autoload 'tuareg-mode			"tuareg" "Tuareg Mode" t)
(autoload 'camldebug			"camldebug" "Run the Caml debugger" t)

(autoload 'php-mode			"php-mode" nil t)
(autoload 'ruby-mode			"ruby-mode" nil t)
(autoload 'bison-mode			"bison-mode" nil t)
(autoload 'flex-mode			"flex-mode" nil t)
(autoload 'ada-mode			"ada-mode" nil t)
(autoload 'python-mode			"python-mode" nil t)
(autoload 'sqlplus-mode			"sqlplus-mode" nil t)
(autoload 'sh-mode			"sh-script" nil t)
(autoload 'html-accents-mode		"html-acc" nil t)
(autoload 'latex-accents-mode		"latex-acc" nil t)
(autoload 'html-mode 			"html" "Edit HTML docs" t)
(autoload 'maze-mode 			"maze" nil t)

(autoload 'onze				"onze" nil t)
(autoload 'replace-accent		"iso2html" nil t)

;; Comment and header  autoload
(autoload 'global-dabbrev-expand 	"global-dabbrev" nil t)
(autoload 'std-get 			"std_comment" nil t)
(autoload 'update-std-header 		"std_comment" nil t)
(autoload 'std-file-header 		"std_comment" nil t)
(autoload 'insert-std-vertical-comments "std_comment" nil t)
(autoload 'std-toggle-comment 		"std_comment" nil t)

;; My function autoload
(autoload 'line-comment           	"function" nil t)
(autoload 'un-line-comment        	"function" nil t)
(autoload 'delete-line-and-indent 	"function" nil t)
(autoload 'set-default-colors     	"function" nil t)
(autoload 'open-new-frame         	"function" nil t)
(autoload 'new-buffer-frame       	"function" nil t)
(autoload 'justify-line		       	"function" nil t)
(autoload 'vt100-display 		"Falco" nil t)
(autoload 'solitaire 			"solitaire" nil t)

;; Autoload
(setq auto-mode-alist
      (append
       (list
	'("\\.[xch]$"		. c-mode)
	'("\\.fn$"		. c-mode)
	'("\\.ct$"		. c-mode)
	'("\\.it$"		. c-mode)
	'("\\.dc$"		. c-mode)
	'("\\.ex$"		. c-mode)
	'("\\.mc$"		. c-mode)
	'("\\.ic$"		. c-mode)
	'("\\.pk$"		. c-mode)
	'("\\.[ly]$"		. fundamental-mode)
	'("\\.lex$"		. c-mode)
	'("\\.pc$"		. c-mode)
	'("\\.rb$"		. ruby-mode)
	'("\\.pl$"	 	. cperl-mode)
	'("\\.[tT]exinfo$"	. texinfo-mode)
	'("\\.a$"		. ada-mode)
	'("\\.ads$"		. ada-mode)
	'("\\.adb$"	        . ada-mode)
	'("\\.html$"		. html-mode)
	'("\\.tig$"		. tiger-mode)
	'("\\.C$"		. c++-mode)
	'("\\.H$"		. c++-mode)
	'("\\.cc$"		. c++-mode)
	'("\\.hh$"		. c++-mode)
	'("\\.hcc$"		. c++-mode)
	'("\\.l$"		. flex-mode)
	'("\\.ll$"		. flex-mode)
	'("\\.y$)"		. bison-mode)
	'("\\.yy$)"		. bison-mode)
	'("\\.ml$"		. tuareg-mode)
	'("\\.mli$"		. tuareg-mode)
	'("\\.te[xk]$"		. LaTeX-mode)
	'("\\.te$"		. LaTeX-mode)
	'("\\.latex$"		. LaTeX-mode)
	'("\\.py$"		. python-mode)
	'("\\.flex$"		. flex-mode)
	'("\\.lex$"		. flex-mode)
	'("[Mm]akefile$"	. makefile-mode)
	'("\\.mk$"		. makefile-mode)
	'("snd\\.[0-9]*$"	. text-mode)
	'("\\.txt$"	 	. text-mode)
	'("\\.gnus$"		. emacs-lisp-mode)
	'("\\.php[3]*"		. php-mode)
	)
       auto-mode-alist)
      )

;; Templates
(require 'auto-template "auto-template")
(require 'jka-compr)
(setq auto-template-dir "~/.emacs-conf/templates/")
