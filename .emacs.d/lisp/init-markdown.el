;;; init-markdown --- markdown mode
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :ensure t
  :custom
  (markdown-hide-urls t)
  ;; (markdown-hide-markup t)
  (markdown-enable-math t)
  ;; :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "pandoc")
  :config
  (setq markdown-max-image-size '(1000 . 800))
  (setq markdown-fontify-code-blocks-natively t)
  (add-hook 'markdown-mode-hook  (lambda() (markdown-display-inline-images)))
  )

(provide 'init-markdown)
;;; init-markdown.el ends here
