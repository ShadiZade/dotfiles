(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 16)
(menu-bar-mode -1)
(setq visible-bell t)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq make-backup-files nil)
(setq line-move-visual t)
(global-visual-line-mode 1)
(load-theme 'tango-dark)
(ivy-mode 1)
(xclip-mode 1)
(set-face-attribute 'default nil :font "Fira Code Retina" :height 120)

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
 '(package-selected-packages
   '(use-package yaml-mode xclip slime mediawiki markdown-mode lua-mode lorem-ipsum hydra graphviz-dot-mode dash counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
