;;; init-markdown --- markdown mode
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :config
  (setq markdown-fontify-code-blocks-natively t))

(provide 'init-markdown)
;;; init-markdown.el ends here
