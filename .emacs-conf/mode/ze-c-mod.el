;;(load ".my-c-mod")
(setq c-basic-offset 2)
(add-hook 'c-mode-hook
	  '(lambda ()
	     (c-add-style "ze"
			  '((string . -1000)
			    (c . c-lineup-C-comments)
			    (defun-open . 0)
			    (defun-close . 0)
			    (defun-block-intro . +)
			    (class-open . 0)
			    (class-close . 0)
			    (inline-open . +)
			    (inline-close . 0)
			    (func-decl-cont . +)
			    (knr-argdecl-intro . 0)
			    (knr-argdecl . 0)
			    (topmost-intro . 0)
			    (topmost-intro-cont . 0)
			    (member-init-intro . +)
			    (member-init-cont . 0)
			    (inher-intro . +)
			    (inher-cont . c-lineup-multi-inher)
			    (block-open . 0)
			    (block-close . 0)
			    (brace-list-open . 0)
			    (brace-list-close . 0)
			    (brace-list-intro . +)
			    (brace-list-entry . 0)
			    (statement . 0)
			    (statement-cont . +)
			    (statement-block-intro . +)
			    (statement-case-intro . +)
			    (statement-case-open . 0)
			    (substatement . +)
			    (substatement-open . 0)
			    (case-label . 0)
			    (access-label . -)
			    (label . 0)
			    (do-while-closure . 0)
			    (else-clause . 0)
			    (comment-intro . c-lineup-comment)
			    (arglist-intro . -)
			    (arglist-cont . 0)
			    (arglist-cont-nonempty . c-lineup-arglist)
			    (arglist-close . +)
			    (stream-op . c-lineup-streamop)
			    (inclass . +)
			    (cpp-macro . -1000)
			    (friend . 0)
			    (objc-method-intro . -1000)
			    (objc-method-args-cont . c-lineup-ObjC-method-args)
			    (objc-method-call-cont . c-lineup-ObjC-method-call)
			    (extern-lang-open . 0)
			    (extern-lang-close . 0)
			    (inextern-lang . +)
			    (template-args-cont . +)
			    (c-basic-offset . 2)
			    (c-comment-only-line-offset . 0)
			    (c-offsets-alist
			     (statement-block-intro . +)
			     (knr-argdecl-intro . 0)
			     (substatement-open . 0)
			     (label . 0)
			     (statement-cont . +))
			    )
			  1)
	     ))













