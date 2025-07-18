;; unset
(keymap-global-unset "C-x C-k <return>")
(keymap-global-unset "C-x C-p")
(keymap-global-unset "C-x C-u")
(keymap-global-unset "C-x C-l")
(keymap-global-unset "C-x C-d")
(keymap-global-unset "C-x C-r")
(keymap-global-unset "C-x C-n")
(keymap-global-unset "C-x C-j")
(keymap-global-unset "C-x C-z")
(keymap-global-unset "C-z")
(keymap-global-unset "M-z")
(keymap-global-unset "M-m")
(keymap-global-unset "M-h")
(keymap-global-unset "M-j")

;; global bindings
(keymap-global-set "<escape>"        'keyboard-escape-quit)
(keymap-global-set "M-s M-s"         'company-refresh-and-complete)
(keymap-global-set "C-x C-,"         'eval-buffer)
(keymap-global-set "<prior>"         (lambda () (interactive) (other-window -1)))
(keymap-global-set "<next>"          'other-window)
(keymap-global-set "C-<left>"	     'delete-window)
(keymap-global-set "C-<up>"	     'delete-other-windows)
(keymap-global-set "C-<right>"       'split-window-horizontally)
(keymap-global-set "C-<down>"        'split-window-vertically)
(keymap-global-set "C-’ i b"         'ispell-buffer)
(keymap-global-set "C-’ i r"         'ispell-region)
(keymap-global-set "C-’ c"           'shadi/reload-config-file)
(keymap-global-set "C-’ r"           'rename-file)
(keymap-global-set "C-’ C-’"         'lingva-translate)
(keymap-global-set "C-’ o"           'olivetti-mode)
(keymap-global-set "C-’ <"           'diff-buffer-with-file)
(keymap-global-set "C-’ ~"           'shadi/sign)
(keymap-global-set "C-’ a <right>"   'set-buffer-directionality-right)
(keymap-global-set "C-’ a <left>"    'set-buffer-directionality-left)
(keymap-global-set "C-’ a <prior>"   'shadi/text-force-ltr)
(keymap-global-set "C-’ a <next>"    'shadi/text-force-rtl)
(keymap-global-set "C-’ f"           'shadi/fetch-events)
(keymap-global-set "C-c r"           'shadi/kebab-region)
(keymap-global-set "C-c y"           'shadi/kebab-and-yank)
(keymap-global-set "C-’ d"           'date-string)
(keymap-global-set "C-c a"           'org-agenda-list)
(keymap-global-set "C-c s"           'scratch-buffer)
(keymap-global-set "C-c SPC"         'ispell-word)
(keymap-global-set "C-c ’"           'su-read-only)
(keymap-global-set "C-c l"           'counsel-unicode-char)
(keymap-global-set "M-<up>"          'move-text-up)
(keymap-global-set "M-<down>"        'move-text-down)
(keymap-global-set "C-c <backspace>" 'clear-scratch-buffer)
(keymap-global-set "C-="             'full-calc)
(keymap-global-set "C-x C-'"         'save-buffers-kill-emacs)
(keymap-global-set "<f5>"            'kmacro-set-counter)
(keymap-global-set "<f6>"            'kmacro-edit-macro)
(keymap-global-set "<f7>"            'kmacro-name-last-macro)
(keymap-global-set "<f8>"            'insert-kbd-macro)
(keymap-global-set "C-x a d"         'edit-abbrevs)
(keymap-global-set "C-x C-p l"       'package-list-packages)
(keymap-global-set "C-x C-p i"       'package-install)
(keymap-global-set "C-x C-p d"       'package-delete)
(keymap-global-set "M-u"             'upcase-region-or-word)
(keymap-global-set "M-l"             'downcase-region-or-word)
(keymap-global-set "M-c"             'capitalize-region-or-word)
(keymap-global-set "C-x C-l"         'lorem-ipsum-insert-sentences)
(keymap-global-set "C-,"             'nswbuff-switch-to-previous-buffer)
(keymap-global-set "C-."             'nswbuff-switch-to-next-buffer)
(keymap-global-set "C-'"             'nswbuff-kill-this-buffer)


;; dired
(keymap-global-set "C-c v m n"         (lambda () (interactive) (dired "~/Misc/notes")))
(keymap-global-set "C-c v m d"         (lambda () (interactive) (dired "~/Misc/diary")))
(keymap-global-set "C-c v m o"         (lambda () (interactive) (dired "~/Misc/org")))
(keymap-global-set "C-c v j w"         (lambda () (interactive) (dired "~/Projects/writings")))
(keymap-global-set "C-c v l s u"       (lambda () (interactive) (dired "~/.local/share/user-scripts")))

;; specific files
(keymap-global-set "C-’ e i"           (lambda () (interactive)
					 (find-file "~/Repositories/dotfiles/emacs/init.el")))
(keymap-global-set "C-’ e f"           (lambda () (interactive)
					 (find-file "~/Repositories/dotfiles/emacs/functions.el")))         
(keymap-global-set "C-’ e h"           (lambda () (interactive)
					 (find-file "~/Repositories/dotfiles/emacs/hooks.el")))                  
(keymap-global-set "C-’ e b"           (lambda () (interactive)
					 (find-file "~/Repositories/dotfiles/emacs/bind.el")))                           
(keymap-global-set "C-’ e o"           (lambda () (interactive)
					 (find-file "~/Repositories/dotfiles/emacs/org.el")))                           
(keymap-global-set "C-’ t"             (lambda () (interactive)
					 (find-file "~/Misc/org/task.org")))
(keymap-global-set "C-’ w"             (lambda () (interactive)
					 (find-file "~/Misc/org/tiasut.org")))
(keymap-global-set "C-’ n"             (lambda () (interactive)
					 (find-file "~/Archives/Personal/notebook/notebook.md")
					 (end-of-buffer)
					 (olivetti-mode)))
(keymap-global-set "C-’ $"             (lambda () (interactive)
					 (find-file "~/Archives/Personal/bookkeeping/book.beancount")
					 (text-scale-set 2)
					 (end-of-buffer)))

;; apps
(keymap-global-set "C-z b"   'ebuku)
(keymap-global-set "C-z f"   'shadi/load-elfeed)

;; mode bindings
(keymap-global-set "C-| t" 'text-mode)
(keymap-global-set "C-| o" 'org-mode)
(keymap-global-set "C-| m" 'markdown-mode)
(keymap-global-set "C-| e" 'emacs-lisp-mode)
(keymap-global-set "C-| b" 'shell-script-mode)
(keymap-global-set "C-| l" 'TeX-tex-mode)

;; frequent-words
(keymap-global-set "C-c 1"  (lambda () (interactive) (shadi/fw 1)))
(keymap-global-set "C-c 2"  (lambda () (interactive) (shadi/fw 2)))
(keymap-global-set "C-c 3"  (lambda () (interactive) (shadi/fw 3)))
(keymap-global-set "C-c 4"  (lambda () (interactive) (shadi/fw 4)))
(keymap-global-set "C-c 5"  (lambda () (interactive) (shadi/fw 5)))
(keymap-global-set "C-c 6"  (lambda () (interactive) (shadi/fw 6)))
(keymap-global-set "C-c 7"  (lambda () (interactive) (shadi/fw 7)))
(keymap-global-set "C-c 8"  (lambda () (interactive) (shadi/fw 8)))
(keymap-global-set "C-c 9"  (lambda () (interactive) (shadi/fw 9)))


