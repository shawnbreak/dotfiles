;;; init-kill-ring --- kill ring enhancement
;;; Commentary:
;;; Code:

;; (use-package popup-kill-ring
;;  :ensure t)

(use-package browse-kill-ring
  :ensure t
  :config
  (browse-kill-ring-default-keybindings))

(provide 'init-kill-ring)
;;; init-kill-ring.el ends here
