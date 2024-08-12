;;; init-misc --- misc
;;; Commentary:
;;; Code:

;; Don't show minor mode in mode line.
(use-package diminish
  :ensure t)

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; use acw-window
(global-set-key (kbd "M-o") 'ace-window)

(use-package imenu-list
  :ensure t)


(use-package expand-region
  :bind ("C-=" . er/expand-region)
  ("C--". er/contract-region))

;;; Minor-mode to add space between Chinese and English characters.
(use-package pangu-spacing
  :ensure t
  :config
  (add-hook 'markdown-mode-hook (lambda()
				  (pangu-spacing-mode))))

(use-package vlf
  :ensure t)

(use-package smartparens)
 	
(use-package tex
  :ensure auctex)

(use-package rime
  :custom
  (default-input-method "rime"))

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-;") 'avy-goto-char)
  (global-set-key (kbd "C-:") 'avy-goto-char-2)
  (global-set-key (kbd "M-g f") 'avy-goto-line))

(use-package command-log-mode)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)))

(provide 'init-misc)
;;; init-misc.el ends here
