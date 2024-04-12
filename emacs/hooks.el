(add-hook 'bibtex-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-~") 'yank-bib-and-copy-name)
	    ))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-~") 'tex-insert-paper-name-as-comment)
	    (local-set-key (kbd "C-c C-/") 'tex-uncomment-cite-and-copy)
	    (local-set-key (kbd "; c")     'tex-insert-ci)
	    (local-set-key (kbd "; i")     'tex-italic-region)
	    (local-set-key (kbd "; b")     'tex-bold-region)
	    (local-set-key (kbd "; s")     'tex-insert-species)
	    (local-set-key (kbd "; ;")     'tex-insert-comment)
	    (local-set-key (kbd "\"")      'tex-enquote)
	    (local-set-key (kbd "C-=") 'run-setsh-script)
	    ;; ispell skip new commands
	    (setq ispell-tex-skip-alists
                   (list
                    (append
                     (car ispell-tex-skip-alists) 
                     '(
		       ("\\\\ci"       ispell-tex-arg-end)
		       ("\\\\species"  ispell-tex-arg-end)
		       ))
                    (cadr ispell-tex-skip-alists)))
	    ;; custom syntax highlighting
	    (font-lock-add-keywords nil
				    '(("\\\\ci\\>"          0   font-lock-constant-face      t)
				      ("\\\\enquote\\>"     0   font-lock-warning-face       t)
				      ("\\\\species\\>"     0   font-lock-warning-face       t)
				      ("\\\\csection\\>"    0   font-lock-warning-face       t)
				      ))
	    ))

(add-hook 'shell-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c n o t") 'bash-not-structure)
	    ))

(add-hook 'markdown-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-=") 'run-setsh-script)
	    ))

(add-hook 'mhtml-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c r") 'do-xhtml-refs)
	    (local-set-key (kbd "C-c b") 'do-xhtml-blockquote)
	    (local-set-key (kbd "C-c i") 'do-xhtml-italic-region)
	    ))

(add-hook 'pdf-view-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-s") 'isearch-forward)
	    ))

(add-hook 'text-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c f") 'move-progress-forward)
	    ))

(add-hook 'dired-mode-hook
	  'auto-revert-mode)
