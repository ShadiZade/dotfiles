;; themes
(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))
(unless (package-installed-p 'atom-one-dark-theme)
  (package-install 'atom-one-dark-theme))
(load-theme 'gruvbox t)
; (load-theme 'atom-one-dark t)

(setq-default abbrev-mode t)
(abbrev-mode nil)
(setq abbrev-suggest 1)
(setq abbrev-file-name "~/Repositories/private/abbrev_defs")
(setq save-abbrevs 'silently)
(read-abbrev-file nil)


(load "~/.config/emacs/functions.el")
(load "~/.config/emacs/macros.el")
(load "~/.config/emacs/bind.el")
(load "~/.config/emacs/hooks.el")
(load "~/.config/emacs/org.el")
(add-to-list 'load-path (concat user-emacs-directory "lisp/" ))
(load "beancount.el")

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

;; (pdf-tools-install)

;; init package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			;; ("org" . "https://orgmode.org/elpa")
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
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d"
     default))
 '(package-selected-packages
   '(all-the-icons all-the-icons-dired arjen-grey-theme
		   atom-one-dark-theme auctex auto-compile
		   baidu-translate beacon calmer-forest-theme
		   casual-calc charmap circe company company-auctex
		   company-emoji company-spell counsel counsel-tramp
		   csv-mode ct dash ebuku elfeed ess geiser
		   geiser-racket general graphviz-dot-mode
		   gruvbox-theme gscholar-bibtex helpful hydra
		   insert-char-preview ivy-rich jumblr languagetool
		   lines-at-once linguistic lingva lorem-ipsum
		   lua-mode magit markdown-mode mbsync mediawiki
		   mingus move-text mu4easy nerd-icons-dired nov
		   olivetti openwith org-bullets org-mode
		   org-translate paperless paredit pdf-tools pdfgrep
		   poly-R pyim pyim-basedict pyim-cangjiedict quiz
		   racket-mode rainbow-delimiters reverso
		   scholar-import slime su sudo-utils swagg
		   sxhkdrc-mode sxiv unbound unipoint use-package
		   which-key xclip xwiki-mode yaml-mode yaml-pro zotra)))
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

(use-package nswbuff
  :config
  (setq nswbuff-display-intermediate-buffers t)) 

(put 'set-goal-column 'disabled nil)

(delete
 '("\\.rkt\\'" . scheme-mode) auto-mode-alist)
(add-to-list
 'auto-mode-alist
 '("\\.rkt\\'" . racket-mode))

(setq org-file-apps
      '(
	(auto-mode . emacs)
	(directory . emacs)
	("\\.mm\\'" . default)
	("\\.x?html?\\'" . default)
	("\\.pdf\\'" . "sioyek %s")
	("\\.ps\\'" . "sioyek %s")
	("\\.djvu\\'" . "sioyek %s")
	("\\.epub\\'" . "sioyek %s")
	("\\.mobi\\'" . "sioyek %s")
	("\\.cbz\\'" . "sioyek %s")
	("\\.jpg\\'" . "sxiv %s")
	("\\.jpeg\\'" . "sxiv %s")
	("\\.png\\'" . "sxiv %s")
	("\\.gif\\'" . "sxiv %s")
	("\\.webp\\'" . "sxiv %s")
	("\\.jxl\\'" . "sxiv %s")
	("\\.jpg_large\\'" . "sxiv %s")
	("\\.jp2\\'" . "sxiv %s")
	("\\.svg\\'" . "sxiv %s")
	("\\.tif\\'" . "sxiv %s")
	("\\.avif\\'" . "sxiv %s")
	("\\.mp4\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	("\\.mkv\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	("\\.avi\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	("\\.ts\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	("\\.mov\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	("\\.webm\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	("\\.m4v\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	("\\.mp3\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	("\\.flac\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	("\\.ogg\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	("\\.opus\\'" . "mpv --osd-fractions --audio-samplerate=88200 %s")
	)
      )

;;(add-to-list 'auto-mode-alist '("/athenaeum-index.csv\\'" . read-only-mode))
;;(add-to-list 'auto-mode-alist '("/athenaeum-index.csv\\'" . auto-revert-mode))
;;(add-to-list 'auto-mode-alist '("/sxhkdrc\\'"             . sxhkdrc-mode))

(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-listing-switches "-alh")
(use-package elfeed)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; (if (daemonp)
;;     (add-hook 'after-make-frame-functions
;;              (lambda (frame)
;;                (with-selected-frame frame
;;                  (shadi/set-latin-font "JuliaMono"))))
;;   (shadi/set-latin-font "JuliaMono"))
;; (shadi/set-chinese-font "LXGW WenKai")
;; (shadi/set-arabic-font "Kawkab Mono")

;; (shadi/set-chinese-font "Noto Serif CJK SC")
;; (shadi/set-chinese-font "Unifont\-JP")

;; (shadi/set-arabic-font "Kawkab Mono")
;; (add-to-list 'face-font-rescale-alist '(".*JuliaMono.*" . 1.0))
;; (add-to-list 'face-font-rescale-alist '(".*Amiri.*" . 0.4))
;; (add-to-list 'face-font-rescale-alist '(".*Kawkab.*" . 0.4))
;; (shadi/set-chinese-font "Noto Serif CJK SC")
;; (shadi/set-chinese-font "Unifont\-JP")

;; (shadi/set-all-fonts "Fira Code" "Kawkab Mono" "LXGW WenKai")

(shadi/set-latin-font)
(shadi/set-chinese-font "LXGW WenKai")
(shadi/set-arabic-font "Kawkab Mono")
				
;; (package-refresh-contents) ;; takes too long when reloading config
(setq indent-tabs-mode 'only)


(use-package pomidor
  :bind (("<f12>" . pomidor))
  :config (setq pomidor-sound-tick nil 
		pomidor-sound-tack nil 
		pomidor-sound-overwork (expand-file-name (concat pomidor-dir "overwork.wav"))
		pomidor-sound-break-over (expand-file-name (concat (getenv "HOME") "/Music/overwork.wav")))
  :hook (pomidor-mode . (lambda ()
                          (setq left-fringe-width 0 right-fringe-width 0)
                          (setq left-margin-width 2 right-margin-width 0)
                          (set-window-buffer nil (current-buffer))
			  (text-scale-set -1)
			  (emacs-lock-mode))))
