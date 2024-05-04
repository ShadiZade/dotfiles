;; themes
(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))
(unless (package-installed-p 'atom-one-dark-theme)
  (package-install 'atom-one-dark-theme))
(load-theme 'gruvbox t)
; (load-theme 'atom-one-dark t)

(load "~/.config/emacs/functions.el")
(load "~/.config/emacs/macros.el")
(load "~/.config/emacs/bind.el")
(load "~/.config/emacs/hooks.el")
(load "~/.config/emacs/org.el")
 

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 16)
(menu-bar-mode -1)
(beacon-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(setq visible-bell t)
(setq make-backup-files nil)
(setq line-move-visual t)
(setq inferior-lisp-program (executable-find "clisp"))
(setq initial-scratch-message nil)
(global-visual-line-mode 1)
(xclip-mode 1)
(size-indication-mode 1)
(column-number-mode)
(defun shadi/set-font-faces ()
  (message "Setting faces...")
  (set-face-attribute 'default nil :font "JuliaMono" :height 120))

;; (setq default-frame-alist '((font . "JuliaMono")))

(if (daemonp)
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(with-selected-frame frame
		  (shadi/set-font-faces))))
  (shadi/set-font-faces))

(shadi/set-arabic-font '9)
(pdf-tools-install)

;; init package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" default))
 '(package-selected-packages
   '(reverso ebuku lines-at-once linguistic baidu-translate lingva org-translate su mu4easy insert-char-preview unipoint sxhkdrc-mode sxiv counsel-tramp auto-compile pdf-tools paperless pdfgrep scholar-import auctex company-auctex move-text company-spell company-emoji company magit unbound jumblr mines quiz gscholar-bibtex ess poly-R csv-mode nov yaml-mode calmer-forest-theme beacon atom-one-dark-theme arjen-grey-theme elfeed slime xwiki-mode olivetti org-bullets sudo-utils org-mode general all-the-icons-dired all-the-icons gruvbox-theme helpful ivy-rich which-key rainbow-delimiters use-package xclip mediawiki markdown-mode lua-mode lorem-ipsum hydra graphviz-dot-mode dash counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line-active ((t (:inherit mode-line :background "dark olive green" :foreground "white smoke")))))

(use-package general)

;; use-package
(use-package ivy
  :diminish
  :bind (("C-s" . swiper))
  :config
  (ivy-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-switch-buffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; removes ^ from beginning

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package all-the-icons
  :if (display-graphic-p)
  :commands all-the-icons-install-fonts
  :init
  (unless (find-font (font-spec :name "all-the-icons"))
    (all-the-icons-install-fonts t)))

(use-package all-the-icons-dired
  :if (display-graphic-p)
  :hook (dired-mode . all-the-icons-dired-mode))

(defun org-mode-setup ()
  (org-indent-mode)
  (auto-fill-mode))

(use-package org
  :hook (org-mode . org-mode-setup)
  :config
  (setq org-ellipsis " ☈"
	org-hide-emphasis-markers t
	org-todo-keywords
;	org-log-done 'time
	'((sequence "TODO" "INPR" "|" "DONE" "CANC"))))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package elfeed)

