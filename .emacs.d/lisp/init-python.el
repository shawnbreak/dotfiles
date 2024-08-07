;;; init-python --- python-mode
;;; Commentary:
;;; Code:

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(provide 'init-python)
;;; init-python.el ends here
