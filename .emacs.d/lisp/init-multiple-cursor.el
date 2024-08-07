;;; init-multiple-cursor --- multipler cursor
;;; Commentary:
;;; Code:

;; multiple cursors
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(provide 'init-multiple-cursor)
;;; init-multiple-cursor.el ends here
