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

;;; text-mode (text-mode-hook)
(defalias 'move-progress-forward
   (kmacro "C-r ⨯ SPC P R O G R E S S SPC ⨯ <return> C-k C-x C-x C-y"))

