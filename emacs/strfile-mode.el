(defvar strfile-mode-hook nil)

(defvar strfile-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for strfile major mode")
(add-to-list 'auto-mode-alist '("\\.strfile\\'" . strfile-mode))

(regexp-opt '("%") t)
