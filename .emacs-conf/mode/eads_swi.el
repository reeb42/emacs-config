;;
;; eads_swi.el
;; 
;; Made by (Vincent CUISSARD)
;; Login   <vincent.cuissard@gmail.com>
;; 
;; Started on  Tue Jan 31 15:44:39 2006 Vincent CUISSARD
;; Last update Tue Jan 31 16:50:41 2006 Vincent CUISSARD
;;

;; Local
(defun complete-line (line str size)
  (let ((lenStr (length str))
	(lenLine (length line))
	(i 0)
	(nb 0)
	(ret "")
	(EOC "*/")
	(SOC "/*"))
    (setq ret (concat line str))
    (setq nb (- size (+ lenLine lenStr)))
    (while (< i nb)
      (setq ret (concat ret
			" "))
      (setq i (+ i 1))
      )
    (insert-string (concat SOC
			   ret
			   EOC))
    )
  )



(defun test ()
  (interactive)
  (let ((val "")(ret ""))
    (setq val (read-from-minibuffer
	       (format "Val: ")))
    (setq ret (complete-line "Ceci est un test: " val 79))
    )
  )


;; Export

(defun eads-swi-insert-header ()
  (interactive)
  (let ((type "UTS"))
    (setq type (read-from-minibuffer
		(format "Type of the file (UIS|UTS): ")))

    (insert-string (concat "/*$$ "
			   type
			   " ********************************************************************/"
			   "/*  Fichier    : "
			   (buffer-name)
			   "  */"
			   "/*--------------------------------------------------------------------------*/"
			   "/*  Objet      :                                                            */"
			   "/*                                                                          */"
			   "/*  Contenu    :                                                            */"
			   "/*                                                                          */"
			   "/*                                                                          */"
			   "/*  Historique :                                                            */"
			   "/*--------------------------------------------------------------------------*/"
			   "/*   Date   | Auteur    |  Ite.  | Nature de la modification                */"
			   "/*----------+-----------+--------+------------------------------------------*/"
			   "/* 17/1/2006|V.Cuissard |  0001  | Creation                                 */"
			   "/*$$ E" 
			   type
			   " *******************************************************************/"))
    )			   
  )

(defun eads-swi-insert-fun ()
  (interactive)
  (let ((type "P")(name "foo")(val ""))
    (setq type (read-from-minibuffer
		(format "Type of function (P|S|X): ")))
    (setq name (read-from-minibuffer
		(format "Name of function: ")))
    (setq val (concat "FCT"
		      type))
    (insert-string (concat "/*$$ "
			   val
			   " *******************************************************************/\n"
			   "/*  Fonction   : \n"
			   name
			   "  */\n"
			   "/*--------------------------------------------------------------------------*/\n"
			   "/*  Objet      :                                                            */\n"
			   "/*                                                                          */\n"
			   "/*  Resultat   :                                                            */\n"
			   "/*                                                                          */\n"
			   "/*                                                                          */\n"
			   "/*  Interfaces :                                                            */\n"
			   "/*--------------------------------------------------------------------------*/\n"
			   "/*  Nom Variable      |IN |OUT|PAR|  Utilisation                            */\n"
			   "/*--------------------+---+---+---+-----------------------------------------*/\n"
			   "/*                    |   |   |   |                                         */\n"
			   "/*                    |   |   |   |                                         */\n"
			   "/*--------------------+---+---+---+-----------------------------------------*/\n"
			   "/*                    |   |   |   |                                         */\n"
			   "/*                    |   |   |   |                                         */\n"
			   "/*$$ E"
			   val
			   " ******************************************************************/\n")
		   )
    )
  )


(defun eads-swi-insert-pdl ()
  (interactive)
  (let ((name ""))
    (setq name (read-from-minibuffer
		(format "Name of the function: ")))
    (insert-string (concat "/*$$ CMTF *******************************************************************/\n"
			   "/*  P.D.L. de la function "
			   name
			   " */\n"
			   "/*--------------------------------------------------------------------------*/\n"
			   "/*                                                                          */\n"
			   "/*$$ ECMTF ******************************************************************/\n"))
    )
  )


