;;; init-markdown --- markdown mode
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :ensure t
  :custom
  (markdown-hide-urls t)
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "pandoc")
  :config
  (setq markdown-fontify-code-blocks-natively t)
  (markdown-display-inline-images)
  )

(provide 'init-markdown)
;;; init-markdown.el ends here
