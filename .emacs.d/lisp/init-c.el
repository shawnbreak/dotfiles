;;; init-c --- c-mode
;;; Commentary:
;;; Code:

(use-package ggtags
  :ensure t)

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;               (ggtags-mode 1))))

;; clangd arguments
(setq lsp-clients-clangd-args '("--header-insertion-decorators=0" "--clang-tidy" "--background-index=false"))


(provide 'init-c)
;;; init-c.el ends here
