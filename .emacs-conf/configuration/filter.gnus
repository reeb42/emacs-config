;; -*- Mode: Emacs-Lisp -*-
(setq nnmail-split-methods '(
			     ("NNL" "^To.*nnl@aful.org.*")
			     ("LinuxInfo" "^\\([Cc][Cc]\\|To\\).*linux-infos@nnx.com")
			     ("Mail-Perso" "^\\([Cc][Cc]\\|To\\).*chmouel@mandrakesoft.com")
			     ("Autres" "")
			     ))
(setq gnus-auto-expirable-newsgroups
      "Mail-Perso\\|NNL\\|Autres\\|Kernel-Devel") 
