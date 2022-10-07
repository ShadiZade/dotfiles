;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;					 ____  _   _    _    ____ ___     _____   _    ____  _____ 
;;;					/ ___|| | | |  / \  |  _ \_ _|   |__  /  / \  |  _ \| ____|
;;;					\___ \| |_| | / _ \ | | | | |_____ / /  / _ \ | | | |  _|  
;;;					 ___) |  _  |/ ___ \| |_| | |_____/ /_ / ___ \| |_| | |___ 
;;;					|____/|_| |_/_/   \_\____/___|   /____/_/   \_\____/|_____|
;;;
;;;					https://github.com/ShadiZade
;;;					init.el
;;;					emacs config
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; symlink location: ~/.config/emacs/ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
   '(markdown-mode 2048-game wc-mode slime xkcd private-diary pomodoro which-key)))
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
(global-set-key (kbd "C-c C-x C-/") 'strike-through-for-org-mode)
(global-set-key (kbd "C-c C-<return>") 'org-insert-subheading)

;;; Functions
;;;; org mode strikethrough
(defun strike-through-for-org-mode ()
      (interactive)
      (beginning-of-line)  
      (save-excursion     
        (if (string-prefix-p "*" (thing-at-point 'line t))  
            (progn
              (setq go_char (string-match "[ ]" (thing-at-point 'line t)))  
              (forward-char (+ go_char 1))
              (insert "+")   
              (end-of-line)  
              (insert "+")   
              )
          (if (string-match "[^ ]" (thing-at-point 'line t))  
              (progn
                (setq go_char (string-match "[^ ]" (thing-at-point 'line t)))  
                (forward-char (+ go_char 2))  
                (insert "+")   
                (end-of-line)  
                (insert "+")  
                )
            (message "[-] Not Proper Position!")
            )
          )
        )
      )

;;;;
