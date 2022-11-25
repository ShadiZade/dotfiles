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
(set-fringe-mode 20)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)
(ivy-mode 1)
(setq make-backup-files nil)
(setq visible-bell 1)

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bongo-default-directory nil)
 '(custom-enabled-themes '(tango-dark))
 '(custom-safe-themes
   '("a556e4e6fc62469cd28a57c3b5386807d676a33176659f849fc53fa8763f5955" default))
 '(elfeed-feeds
   '("https://babelwad.com/feed/" "https://www.smbc-comics.com/comic/rss" "https://phdcomics.com/gradfeed.php" "https://xkcd.com/atom.xml" "https://simonwillison.net/atom/entries/" "https://pluralistic.net/feed/"))
 '(global-visual-line-mode t)
 '(package-selected-packages
   '(slime yaml-mode elfeed powershell 2048-game counsel auto-package-update annotate)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


