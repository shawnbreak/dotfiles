;;; init-lsp --- lsp-mode
;;; Commentary:
;;; Code:


;; lsp mode optimize
(setq gc-cons-threshold (* 1024 1024 100)) ;; 100 MiB
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ;; (XXX-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
(setq lsp-headerline-breadcrumb-enable nil)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(add-hook 'python-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)

(provide 'init-lsp)
;;; init-lsp.el ends here
