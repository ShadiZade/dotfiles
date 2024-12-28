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

(defun shadi/set-arabic-font (arabic-font-size)
  "Sets my emacs Arabic font and size."
  (interactive)
  (set-fontset-font "fontset-default" 'arabic
		    (font-spec :family "Amiri" :size arabic-font-size)))

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

(defun shadi/sign ()
  (interactive)
  (shell-command
   "echo -n '——— Shadi, '; date '+%A %Y/%m/%d %H:%M:%S %Z'"
   (current-buffer))
  (end-of-visual-line)
  (newline)
  (newline))

(defun shadi/open-org-task ()
  (interactive)
  (find-file "~/Misc/org/task.org"))

(defun shadi/open-org-tiasut ()
  (interactive)
  (find-file "~/Misc/org/tiasut.org"))

(defun shadi/open-notebook ()
  (interactive)
  (find-file "~/Archives/Personal/notebook/notebook.md")
  (end-of-buffer)
  (olivetti-mode))

(defun company-refresh-and-complete ()
  (interactive)
  (company-mode nil)
  (company-mode 1)
  (company-complete))
  
(defun set-buffer-directionality-right ()
  (interactive)
  (setq bidi-paragraph-direction 'right-to-left)
  (message "Shifted to Arabic mode"))

(defun set-buffer-directionality-left ()
  (interactive)
  (setq bidi-paragraph-direction nil)
  (message "Exiting Arabic mode"))

(defun su-read-only ()
  (interactive)
  (su)
  (read-only-mode 0))

(defun clear-scratch-buffer ()
  (interactive)
  (scratch-buffer)
  (mark-whole-buffer)
  (backward-delete-char-untabify 1)
  (message "Cleared scratch buffer"))

(defun run-script-in-same-dir (filename)
  (interactive)
  (save-buffer)
  (if (and (file-exists-p filename) (file-executable-p filename))
      (progn
	(executable-interpret filename)
	(delete-other-windows)
	(message (format "Executing script %s..." filename)))
    (message (format "Script %s not found." filename))))

(defun run-setsh-script ()
  (interactive)
  (run-script-in-same-dir "./set.sh"))

(defun shadi/text-force-rtl ()
  (interactive)
  (setq bidi-display-reordering t)
  (message "All text forced RTL"))

(defun shadi/text-force-ltr ()
  (interactive)
  (setq bidi-display-reordering nil)
  (message "All text forced LTR"))

(defun shadi/fw (slot)
  (interactive)
  (shell-command
   (format "~/Repositories/scripts/frequent-words.sh out %s" slot)
   (current-buffer))
  (end-of-visual-line))

(defun dired-open-file ()
  (interactive)
  (let* ((file (dired-get-filename nil t)))
    (message "Opening %s..." file)
    (call-process "xdg-open" nil 0 nil file)
    (message "Opened %s." file)))
	     
(defun explain-auto-mode (file)
  "Explain in which mode FILE gets visited according to `auto-mode-alist'.
With prefix arg, prompt the user for FILE; else, use function `buffer-file-name'."
  (interactive
   (list
    (if current-prefix-arg
	(read-file-name "Explain the automatic mode of (possibly non-existing) file: " )
      (buffer-file-name))))

 (if (equal "" file)
   (error "I need some file name to work with"))

 (let* ((file (expand-file-name file))
	(index 0)
	assoc)
   (setq assoc
	 (catch 'match
	   (while (setq assoc (nth index auto-mode-alist))
	     (if (string-match (car assoc) file)
		 (throw 'match assoc)
	       (setq index (1+ index))))
	   (setq assoc nil)))
   
   (if assoc
       (message "First match in `auto-mode-alist' is at position %d:
\"%s\"  <=>  \"%s\".
The corresponding mode is `%s'."
		(1+ index)
		file (car assoc)
		(cdr assoc))
     (message "No match in `auto-mode-alist' for %s." file))))

(defun shadi/kebab (text)
  (substring
   (shell-command-to-string
    (format "source ~/Repositories/scripts/essential-functions; kebab %s"
	    (shell-quote-argument text)))
   ))

(defun shadi/kebab-region ()
  (interactive)
  (kill-region (point) (mark))
  (kill-new
   (shadi/kebab (current-kill 0 t)))
  (yank))

(defun shadi/kebab-and-yank ()
  (interactive)
  (kill-new
   (shadi/kebab (current-kill 0 t)))
  (yank))
