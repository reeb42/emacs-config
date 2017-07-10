;;
;; macosx-font.el
;;
;; Made by (CUISSARD Vincent)
;; Login   <vincent.cuissard@gmail.com>
;;
;; Started on  Mon Mar  8 11:34:53 2004 CUISSARD Vincent
;; Last update Mon Mar  8 11:39:26 2004 CUISSARD Vincent
;;

(defun gen-font()
  (interactive)
  (
   create-fontset-from-fontset-spec
   "-apple-monaco-medium-r-normal--9-*-*-*-*-*-fontset-monaco,
ascii:-apple-monaco-medium-r-normal--9-90-75-75-m-90-mac-roman,
latin-iso8859-1:-apple-monaco-medium-r-normal--9-90-75-75-m-90-mac-roman")
  )

;; small font
(defun small-font()
  (interactive)
  (set-frame-font "fontset-monaco")
  )

; normal font
(defun mac-font()
  (interactive)
  (set-frame-font "fontset-mac")
  )

; setting favorite french typping style
(defun french-type()
  (interactive)
  ;; select accent after typing
  (french-post-type)
  )

;; return to brisith style typping (no accent)
(defun normal-type()
  (interactive)
  (setq mac-keyboard-text-encoding kTextEncodingISOLatin1)
  (set-input_method 'british)
  )

;; french typping definitions
(defun french-post-type()
  (interactive)
  (setq mac-keyboard-text-encoding kTextEncodingISOLatin1)
  (set-input-method 'latin-1-postfix)
  )
(defun french-pre-type()
  (interactive)
  (setq mac-keyboard-text-encoding kTextEncodingISOLatin1)
  (set-input-method 'latin-1-prefix)
  )
