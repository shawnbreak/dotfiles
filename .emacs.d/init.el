;;; init.el --- my emacs config
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-elpa)

(require 'init-misc)

(require 'init-options)

;; (require 'init-evil)

(require 'init-theme)

(require 'init-which-key)

(require 'init-kill-ring)

;; (require 'init-ivy)
(require 'init-vertico)

;; eglot
(require 'init-eglot)

(require 'init-org)
(require 'init-markdown)

(require 'init-gtags)

;; lsp-mode
;; (require 'init-lsp)
;; (require 'init-c)
;; (require 'init-python)

;; company completion
(require 'init-company)
(require 'init-yas)

;; (require 'init-treemacs)
(require 'init-git)

(require 'md-download)

;; start emacs in server mode
;; (server-start)

(provide 'init)
;;; init.el ends here
