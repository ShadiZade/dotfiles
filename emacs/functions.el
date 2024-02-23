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

(defun resize-window-to (window size)
  "Resizes a window to a specific, absolute value."
  (let* ((old-size (window-size))
	 (size-diff (- size old-size)))
    (window-resize window (cond ((< size 4)
				 (- 4 old-size))
				((> size 32)
				 (- 32 old-size))
				(t size-diff)))))

(defun shadi/load-elfeed ()
  "Load elfeed, shrink font, and update feed."
  (interactive)
  (load "~/.config/emacs/elfeed-feeds.el")
  (elfeed)
  (text-scale-set -1)
  (elfeed-update))

(defun shadi/reload-config-file ()
  "Reloads my config."
  (interactive)
  (load-file "~/.config/emacs/init.el"))

(defun shadi/edit-init ()
  "Shows my init.el file in a buffer."
  (interactive)
  (find-file "~/Repositories/dotfiles/emacs/init.el"))

(defun shadi/edit-functions ()
  "Shows my functions.el file in a buffer."
  (interactive)
  (find-file "~/Repositories/dotfiles/emacs/functions.el"))

(defun shadi/edit-bind ()
  "Shows my bind.el file in a buffer."
  (interactive)
  (find-file "~/Repositories/dotfiles/emacs/bind.el"))

(defun shadi/edit-hook ()
  "Shows my hooks.el file in a buffer."
  (interactive)
  (find-file "~/Repositories/dotfiles/emacs/hooks.el"))

(defun shadi/edit-org ()
  "Shows my bind.el file in a buffer."
  (interactive)
  (find-file "~/Repositories/dotfiles/emacs/org.el"))

(defun shadi/open-notes-dir ()
  "Opens my notes directory in dired."
  (interactive)
  (dired "~/Misc/notes"))

(defun shadi/open-diary-dir ()
  "Opens my diary directory in dired."
  (interactive)
  (dired "~/Misc/diary"))

(defun shadi/open-org-dir ()
  "Opens my notes directory in dired."
  (interactive)
  (dired "~/Misc/org"))

(defun shadi/set-arabic-font (arabic-font-size)
  "Sets my emacs Arabic font and size."
  (interactive)
  (set-fontset-font "fontset-default" 'arabic
		    (font-spec :family "Kawkab Mono" :size arabic-font-size)))

(defun shadi/arabic-font-large ()
  (interactive)
  (shadi/set-arabic-font '16))

(defun shadi/arabic-font-normal ()
  (interactive)
  (shadi/set-arabic-font '9))

(defun shadi/fetch-events ()
  (interactive)
  (let ((targeted-date-file (buffer-name))
	(new-buffer-name "*fetch-events*"))
    (delete-other-windows)
    (split-window-below)
    (other-window 1)
    (get-buffer-create new-buffer-name)
    (switch-to-buffer new-buffer-name)
    (mark-whole-buffer)
    (kill-region (point) (mark))
    (text-scale-set -1)
    (shell-command (format "~/Repositories/communist-calendar/fetch-events.sh %s" targeted-date-file)
		   (current-buffer))
    (let* ((number-of-lines (count-lines (point-min) (point-max))))
      (resize-window-to nil (+ 1 number-of-lines))
      (other-window 1)))) ; could have used (shrink-window-if-larger-than-buffer)

(defun shadi/start-diary-entry ()
  (interactive)
  (switch-to-buffer
   (find-file
    (format "~/Misc/diary/%s"
	    (format-time-string "%Y-%m-%d")))
  (olivetti-mode)))

(defun shadi/open-org-task ()
  (interactive)
  (find-file "~/Misc/org/task.org"))

(defun shadi/open-org-tiasut ()
  (interactive)
  (find-file "~/Misc/org/tiasut.org"))

(defun shadi/open-courses ()
  (interactive)
  (dired "~/Study/uni/courses"))

(defun shadi/open-marxism ()
  (interactive)
  (dired "~/Study/marxism/current"))

(defun company-refresh-and-complete ()
  (interactive)
  (company-mode nil)
  (company-mode 1)
  (company-complete))
  
(defun set-buffer-directionality-right ()
  (interactive)
  (setq bidi-paragraph-direction 'right-to-left)
  (shadi/arabic-font-large)
  (message "Shifted to Arabic mode"))

(defun set-buffer-directionality-left ()
  (interactive)
  (setq bidi-paragraph-direction nil)
  (shadi/arabic-font-normal)
  (message "Exiting Arabic mode"))


;; macros
;;; mhtml-mode (mhtml-mode-hook)
(defalias 'do-xhtml-refs
   (kmacro "C-f M-b C-b <delete> <delete> <delete> <delete> C-SPC M-f M-w <delete> M-b <backspace> < s m a l l > < a SPC h r e f = \" # f n M-f \" > C-y C-c / C-c / M-> < p SPC i d = \" f n C-y \" > C-c / C-b C-b C-b C-b C-y . SPC"))

(defalias 'do-xhtml-blockquote
  (kmacro "< b l o c k q u o t e > C-y C-c / <return> C-p C-a <delete> <delete> C-n <return>"))

(defalias 'do-xhtml-italic-region
  (kmacro "C-x C-x < i > C-x C-x < / i >"))

;;; TeX-tex-mode (LaTeX-mode-hook)
(defalias 'tex-insert-paper-name-as-comment
  (kmacro "<return> % SPC ~ \\ c i { C-y }"))

(defalias 'tex-uncomment-cite-and-copy
  (kmacro "C-a C-s ~ <return> C-b C-SPC C-e M-w"))

(defalias 'tex-insert-ci
  (kmacro "~ \\ c i { } C-b"))

(defalias 'tex-insert-species
  (kmacro "\\ s p e c i e s { } C-b"))

(defalias 'tex-bold-region
  (kmacro "\\ t e x t b f { } C-b"))

(defalias 'tex-italic-region
  (kmacro "\\ t e x t i t { } C-b"))

(defalias 'tex-enquote
  (kmacro "\\ e n q u o t e { } C-b"))

(defalias 'tex-insert-comment
  (kmacro "%"))

;;; bibtex-mode (bibtex-mode-hook)
(defalias 'yank-bib-and-copy-name
   (kmacro "M-> C-y <return> C-s @ <return> M-f M-f C-SPC M-b M-w C-c C-c M-> C-x C-s"))

;;; shell-script-mode (shell-mode-hook)
(defalias 'bash-not-structure
   (kmacro "[ SPC ! SPC \" $ ( ) \" SPC ] C-b C-b C-b C-b"))
