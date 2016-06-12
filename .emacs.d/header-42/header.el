;; (global-set-key (kbd "C-c y") 'header-insert-rush)

;; (defun hligne-plein () "ajout une barre commenter pleine"
;;        (concat "/* " (make-string 74 ?*) " */\n"))
;; (defun hligne-vide () "ajout une barre commenter vide"
;;        (concat "/* " (make-string 74 ?\ ) " */\n"))

;; (defun hligne-check-len (strdebut strfin) "retourne la longueur d'espace a afficher"
;;        (setq lenspace (- 80 (+ (length strdebut) (length strfin))))
;;        (make-string lenspace ?\ )
;;        )

;; (defun hligne-var () "insert ligne" (interactive)
;;        ;; l1-2
;;        (setq l1-2 (concat (hligne-plein) (hligne-vide)))
;;        ;; l3
;;        (setq l3 (concat "/*"(make-string 56 ?\ )":::      ::::::::   */\n"))
;;        ;; filename l4
;;        (setq l4d (concat "/*   "(file-name-nondirectory buffer-file-name)))
;;        (if (> (length l4d) 45)
;;            (setq l4d (concat (substring l4d 0 45) "...")))
;;        (setq l4f ":+:      :+:    :+:   */")
;;        (setq l4 (concat l4d (hligne-check-len l4d l4f) l4f "\n"))
;;        ;; l5
;;        (setq l5 (concat "/*"(make-string 52 ?\ )"+:+ +:+         +:+     */\n"))
;;        ;; mail l6
;;        (setq l6d (concat "/*   By: "(getenv "LOGNAME")" <"(getenv "MAIL")">"))
;;        (setq l6f (concat "+#+  +:+       +#+        */"))
;;        (setq l6 (concat l6d (hligne-check-len l6d l6f) l6f "\n"))
;;        ;; l7
;;        (setq l7 (concat "/*"(make-string 48 ?\ )"+#+#+#+#+#+   +#+           */\n"))
;;        ;; created l8
;;        (setq l8d (concat "/*   Created: "(format-time-string "%Y/%m/%d %H:%M:%S")" by "(getenv "LOGNAME")))
;;        (setq l8f (concat "#+#    #+#             */"))
;;        (setq l8 (concat l8d (hligne-check-len l8d l8f) l8f "\n"))
;;        ;; update l9
;;        (setq l9d (concat "/*""   ""Up""dated: "(format-time-string "%Y/%m/%d %H:%M:%S")" by "(getenv "LOGNAME")))
;;        (setq l9f (concat "###   ########.fr       */"))
;;        (setq l9 (concat l9d (hligne-check-len l9d l9f) l9f "\n"))
;;        ;; fin l10-11
;;        (setq l10-11 (concat (hligne-vide)(hligne-plein)))
;;        (concat l1-2 l3 l4 l5 l6 l7 l8 l9 l10-11)
;;        )

;; (defun hcheck () "Verifie la presence du header" (interactive)
;;        (setq var-hligne-var (hligne-var))
;;        (goto-line 1)
;;        (if (search-forward (hligne-plein) nil 'noerror)
;;            (if (search-forward l3 nil 'noerror)
;;                (if (search-forward l4 nil 'noerror)
;;                    (if (search-forward l5 nil 'noerror)
;;                        (if (search-forward l6 nil 'noerror)
;;                            (if (search-forward l7 nil 'noerror)
;;                                (if (search-forward-regexp "^/\\*   Created: " nil 'noerror)
;;                                    (if (search-forward-regexp (concat "^/\\*   Up""dated: ") nil 'noerror)
;;                                        (if (search-forward l10-11 nil 'noerror)
;;                                            t)
;;                                      )
;;                                  )
;;                              )
;;                          )
;;                      )
;;                  )
;;              )
;;          )
;;        )

;; (defun hupdate-ligne () "Met a jour le up date" (interactive)
;;        (goto-line 9)
;;        (delete-char 81)
;;        (setq l9d (concat "/*""   ""Up""dated: "(format-time-string "%Y/%m/%d %H:%M:%S")" by "(getenv "LOGNAME")))
;;        (setq l9f (concat "###   ########.fr       */"))
;;        (setq l9 (concat l9d (hligne-check-len l9d l9f) l9f "\n"))
;;        (insert l9)
;;        )

;; (defun hupdate-rush () "Met a jour le header si besoin" (interactive)
;;        (goto-line 1)
;;        (if (hcheck)
;;            (hupdate-ligne))
;;        )

;; (defun header-insert-rush () "Insert le header" (interactive)
;;        (unless (hcheck)
;;            (progn (goto-line 1)
;;                   (insert var-hligne-var))
;;                   (message "Insert header"))
;;        )

;; (add-hook 'before-save-hook 'hupdate-rush)
;; (add-hook 'auto-save-hook 'hupdate-rush)
;; (add-hook 'kill-emacs-hook 'hupdate-rush)
;; (set (make-local-variable 'before-save-hook) 'hupdate-rush)
