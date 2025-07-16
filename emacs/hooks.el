(add-hook 'bibtex-mode-hook
	  (lambda ()
	    (keymap-local-set "C-c C-~" 'yank-bib-and-copy-name)
	    ))

(add-hook 'org-mode-hook
	  (lambda ()
	      (keymap-local-unset "C-'")
	      (keymap-local-unset "C-,")))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (keymap-local-set "C-c C-~" 'tex-insert-paper-name-as-comment)
	    (keymap-local-set "C-c C-/" 'tex-uncomment-cite-and-copy)
	    (keymap-local-set "; c"     'tex-insert-ci)
	    (keymap-local-set "; i"     'tex-italic-region)
	    (keymap-local-set "; b"     'tex-bold-region)
	    (keymap-local-set "; s"     'tex-insert-species)
	    (keymap-local-set "; ;"     'tex-insert-comment)
	    (keymap-local-set "\""      'tex-enquote)
	    (keymap-local-set "C-="     'run-setsh-script)
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
	    (keymap-local-set "C-c n o t" 'bash-not-structure)
	    ))

(add-hook 'markdown-mode-hook
	  (lambda ()
	    (keymap-local-set "C-=" 'run-setsh-script)
	    ))

(add-hook 'mhtml-mode-hook
	  (lambda ()
	    (keymap-local-set "C-c r" 'do-xhtml-refs)
	    (keymap-local-set "C-c b" 'do-xhtml-blockquote)
	    (keymap-local-set "C-c i" 'do-xhtml-italic-region)
	    ))

(add-hook 'nroff-mode-hook
	  (lambda ()
	    (keymap-local-set "C-c b" 'nroff-bold-region)
	    (keymap-local-set "C-c i" 'nroff-italic-region)
	    ))

(add-hook 'pdf-view-mode-hook
	  (lambda ()
	    (keymap-local-set "C-s" 'isearch-forward)
	    ))

(add-hook 'text-mode-hook
	  (lambda ()
	    (keymap-local-set "C-c f" 'move-progress-forward)))
	    

(add-hook 'racket-mode-hook
	  (lambda ()
	    (keymap-local-set "C-x C-e" 'racket-eval-last-sexp)
	    (keymap-local-set "<f5>"    'racket-run)
	    ))

(add-hook 'racket-repl-mode-hook
	  (lambda ()
	    (keymap-local-set "<up>"    'racket-repl-previous-input)
	    (keymap-local-set "<down>"  'racket-repl-next-input)
	    (keymap-local-set "M-p"     'racket-repl-previous-prompt)
	    (keymap-local-set "M-n"     'racket-repl-next-prompt)
	    ))

(add-hook 'dired-mode-hook
	  'auto-revert-mode)




(defun athenaeum-index.csv_file_hook ()
  (when (string= (file-name-nondirectory (buffer-file-name)) "athenaeum-index.csv")
    (read-only-mode)
    (auto-revert-mode t)
    )
)

(defun refs.bib_file_hook ()
  (when (string= (file-name-nondirectory (buffer-file-name)) "refs.bib")
    (read-only-mode)
    (auto-revert-mode t)
    )
)

(defun sxhkdrc_file_hook ()
  (when (string= (file-name-nondirectory (buffer-file-name)) "sxhkdrc")
    (sxhkdrc-mode)
    )
)

(add-hook 'find-file-hook 'athenaeum-index.csv_file_hook)
(add-hook 'find-file-hook 'refs.bib_file_hook)
(add-hook 'find-file-hook 'sxhkdrc_file_hook)
