;; global bindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "M-s M-s") 'company-complete)
(global-set-key (kbd "C-x C-,") 'eval-buffer)
(global-set-key (kbd "C-x w") 'shadi/load-elfeed)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-’ i b") 'ispell-buffer)
(global-set-key (kbd "C-’ i r") 'ispell-region)
(global-set-key (kbd "C-’ c") 'shadi/reload-config-file)
(global-set-key (kbd "C-’ r") 'rename-file)
(global-set-key (kbd "C-’ o") 'olivetti-mode)
(global-set-key (kbd "C-’ <") 'diff-buffer-with-file)
(global-set-key (kbd "C-’ e i") 'shadi/edit-init)
(global-set-key (kbd "C-’ e f") 'shadi/edit-functions)
(global-set-key (kbd "C-’ e b") 'shadi/edit-bind)
(global-set-key (kbd "C-’ e o") 'shadi/edit-org)
(global-set-key (kbd "C-’ m n") 'shadi/open-notes-dir)
(global-set-key (kbd "C-’ m d") 'shadi/open-diary-dir)
(global-set-key (kbd "C-’ m o") 'shadi/open-org-dir)
(global-set-key (kbd "C-’ a l") 'shadi/arabic-font-large)
(global-set-key (kbd "C-’ a n") 'shadi/arabic-font-normal)
(global-set-key (kbd "C-’ f") 'shadi/fetch-events)
(global-set-key (kbd "C-’ t") 'shadi/open-org-task)
(global-set-key (kbd "C-’ d") 'shadi/start-diary-entry)
(global-set-key (kbd "C-c a") 'org-agenda-list)
(global-set-key (kbd "C-c s") 'scratch-buffer)
(global-set-key (kbd "C-’ u c") 'shadi/open-courses)
(global-set-key (kbd "C-~") 'mode-line-other-buffer)
(global-set-key (kbd "C-c ’") 'ispell-word)
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

;; mode bindings
(global-set-key (kbd "C-| t") 'text-mode)
(global-set-key (kbd "C-| o") 'org-mode)
(global-set-key (kbd "C-| m") 'markdown-mode)
(global-set-key (kbd "C-| e") 'emacs-lisp-mode)
(global-set-key (kbd "C-| b") 'shell-script-mode)
(global-set-key (kbd "C-| l") 'TeX-tex-mode)

;; local bindings
(add-hook 'bibtex-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-~") 'yank-bib-and-copy-name)
	    ))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-~") 'tex-insert-paper-name-as-comment)
	    (local-set-key (kbd "C-c C-/") 'tex-uncomment-cite-and-copy)
	    (local-set-key (kbd "C-c c")   'tex-insert-ci)
	    (local-set-key (kbd "C-c i")   'tex-italic-region)
	    (local-set-key (kbd "C-c b")   'tex-bold-region)
	    (local-set-key (kbd "\"")      'tex-enquote)
	    (local-set-key (kbd "; ;")     'tex-insert-comment)
	    ))

(add-hook 'shell-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c n o t") 'bash-not-structure)
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
