;;; init-yas --- yasnippet
;;; Commentary:
;;; Code:

(use-package yasnippet
  :ensure t
  :diminish
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :diminish
  :ensure t)

(provide 'init-yas)
;;; init-yas.el ends here
