;;; init-which-key --- which-key
;;; Commentary:
;;; Code:

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idel-delay 0.2))

(provide 'init-which-key)
;;; init-which-key.el ends here
