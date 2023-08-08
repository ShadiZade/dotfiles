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

(defun shadi/load-elfeed ()
  (interactive)
  (load "~/.config/emacs/elfeed-feeds.el")
  (elfeed)
  (text-scale-set -1)
  (elfeed-update))

(defun shadi/reload-config-file ()
  (interactive)
  (load-file "~/.config/emacs/init.el"))

(defun shadi/edit-init ()
  (interactive)
  (find-file "~/Repositories/dotfiles/emacs/init.el"))

(defun shadi/edit-functions ()
  (interactive)
  (find-file "~/Repositories/dotfiles/emacs/functions.el"))

(defun shadi/edit-bind ()
  (interactive)
  (find-file "~/Repositories/dotfiles/emacs/bind.el"))

(defun shadi/open-notes-dir ()
  (interactive)
  (dired "~/Misc/notes"))

(defun shadi/set-arabic-font (arabic-font-size)
  (interactive)
  (set-fontset-font "fontset-default" 'arabic
		    (font-spec :family "Kawkab Mono" :size arabic-font-size)))

(defun shadi/arabic-font-large ()
  (interactive)
  (shadi/set-arabic-font '16))

(defun shadi/arabic-font-normal ()
  (interactive)
  (shadi/set-arabic-font '9))
