;;; init.el --- my emacs config
;;; Commentary:

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-options)
(require 'init-elpa)
(require 'init-misc)
;; (require 'init-evil)
(require 'init-theme)
(require 'init-which-key)
(require 'init-kill-ring)

;; (require 'init-ivy)
(require 'init-vertico)

(require 'init-org)
(require 'init-markdown)

;; lsp-mode
;; (require 'init-lsp)
;; (require 'init-c)
;; (require 'init-python)

;; eglot
(require 'init-eglot)

;;(require 'init-company)
;;(require 'init-yas)

(require 'init-multiple-cursor)

(require 'init-treemacs)
(require 'init-git)

(require 'md-download)

;; start emacs in server mode
(server-start)

(provide 'init)
;;; init.el ends here
