;;; test
;;; Basic appearance options
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(set-face-attribute 'default nil :font "Fira Code Retina" :height 120)

;;; Setting up MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bongo-default-directory nil)
 '(custom-enabled-themes '(misterioso))
 '(custom-safe-themes
   '("a556e4e6fc62469cd28a57c3b5386807d676a33176659f849fc53fa8763f5955" default))
 '(global-visual-line-mode t)
 '(ido-enable-flex-matching t)
 '(ido-mode 'both nil (ido))
 '(package-selected-packages
   '(2048-game wc-mode slime xkcd private-diary pomodoro which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




;;; SLIME options
(setq inferior-lisp-program "sbcl")



;;; Use packages

;;; Keybinds
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c f") 'flyspell-mode)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c C-q") 'slime-close-all-parens-in-sexp)
