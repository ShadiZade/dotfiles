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

(defun shadi/open-notes-dir ()
  "Opens my notes directory in dired."
  (interactive)
  (dired "~/Misc/notes"))

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
	 (new-buffer-name "fetch-events"))
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
      (other-window 1))))

;; macros

(defalias 'do-xhtml-refs
   (kmacro "C-f M-b C-b <delete> <delete> <delete> <delete> C-SPC M-f M-w <delete> M-b <backspace> < s m a l l > < a SPC h r e f = \" # f n M-f \" > C-y C-c / C-c / M-> < p SPC i d = \" f n C-y \" > C-c / C-b C-b C-b C-b C-y . SPC"))

(defalias 'do-xhtml-blockquote
  (kmacro "< b l o c k q u o t e > C-y C-c / <return> C-p C-a <delete> <delete> C-n <return>"))
