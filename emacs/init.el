(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 16)
(menu-bar-mode -1)
(setq visible-bell t)
(setq make-backup-files nil)
(setq line-move-visual t)
(setq inferior-lisp-program (executable-find "sbcl"))
(global-visual-line-mode 1)
(xclip-mode 1)
(column-number-mode)
(set-face-attribute 'default nil :font "JuliaMono" :height 120)
(set-fontset-font "fontset-default" 'arabic "Kawkab Mono")

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
 '(custom-safe-themes
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" default))
 '(package-selected-packages
   '(elfeed slime xwiki-mode olivetti org-bullets sudo-utils org-mode general all-the-icons-dired all-the-icons gruvbox-theme helpful ivy-rich which-key rainbow-delimiters use-package yaml-mode xclip mediawiki markdown-mode lua-mode lorem-ipsum hydra graphviz-dot-mode dash counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; keybindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-c i") 'ispell-buffer)
(global-set-key (kbd "C-c p c") 'shadi--reload-config-file)
(global-set-key (kbd "M-s M-s") 'complete-symbol)
(global-set-key (kbd "C-x C-,") 'eval-buffer)
(global-set-key (kbd "C-x C-]") 'rename-file)
(global-set-key (kbd "C-c o") 'olivetti-mode)
(global-set-key (kbd "C-x w") 'shadi--load-elfeed)
(global-set-key (kbd "M-]") 'other-window)
(use-package general)

;; use-package
(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))
(load-theme 'gruvbox t)

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
	org-hide-emphasis-markers t))
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package elfeed)

;; functions
(defun delete-visited-file (buffer-name)
  "Delete the file visited by the buffer named BUFFER-NAME."
  (interactive "bDelete file visited by buffer ")
  (let* ((buffer (get-buffer buffer-name))
         (filename (buffer-file-name buffer)))
    (when buffer
      (when (and filename
                 (file-exists-p filename))
        (delete-file filename))
      (kill-buffer buffer))))

(defun shadi--load-elfeed ()
  (interactive)
  (load "~/.config/emacs/elfeed-feeds.el")
  (elfeed)
  (text-scale-set -1))

(defun shadi--reload-config-file ()
  (interactive)
  (load "~/.config/emacs/init.el"))

