;;; init-git --- git
;;; Commentary:
;;; Code:

(use-package magit
  :ensure t)

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))


(provide 'init-git)
;;; init-git.el ends here
