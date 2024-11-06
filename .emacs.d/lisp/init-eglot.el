;;; init-lsp --- eglot
;;; Commentary:
;;; Code:

;; lsp mode optimize
(setq gc-cons-threshold (* 1024 1024 100)) ;; 100 MiB
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package eglot
  :ensure t
  :custom
  (eglot-autoshutdown t)
  :init
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'rust-mode-hook 'eglot-ensure)
  (add-hook 'go-mode-hook 'eglot-ensure)
  (setq eglot-ignored-server-capabilities '(:inlayHintProvider))
  :config
  (setq eglot-events-buffer-size 100)
  (setq eldoc-echo-area-prefer-doc-buffer t)
  (define-key eglot-mode-map (kbd "C-c r") 'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c o") 'eglot-code-action-organize-imports)
  (define-key eglot-mode-map (kbd "C-c h") 'eldoc)
  (define-key eglot-mode-map (kbd "<f6>") 'xref-find-definitions))

(use-package rust-mode
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(provide 'init-eglot)
;;; init-eglot.el ends here

