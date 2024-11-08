;;; init-misc --- misc
;;; Commentary:
;;; Code:

;; Don't show minor mode in mode line.
(use-package diminish
  :ensure t
  :config
  (diminish 'yas-minor-mode)
  (diminish 'auto-revert-mode)
  (diminish 'eldoc-mode))

;; built-in alternative is flymake
;; (use-package flycheck
;;   :ensure t
;;   :config
;;   (add-hook 'after-init-hook #'global-flycheck-mode))

;; use acw-window
(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(use-package imenu-list
  :ensure t)

(use-package expand-region
  :bind ("C-=" . er/expand-region)
  ("C--". er/contract-region)
  :config
  (setq er/try-expand-list '(er/mark-word er/mark-symbol er/mark-symbol-with-prefix er/mark-next-accessor er/mark-method-call er/mark-inside-quotes er/mark-outside-quotes er/mark-inside-pairs er/mark-outside-pairs er/mark-comment er/mark-url er/mark-email er/mark-defun er/mark-sentence er/mark-paragraph)))

;;; Minor-mode to add space between Chinese and English characters.
(use-package pangu-spacing
  :diminish
  :ensure t
  :config
  (global-pangu-spacing-mode)
  ;; (dolist (mode '(markdown-mode-hook
  ;; 		  text-mode-hook
  ;; 		  fundamental-mode-hook
  ;; 		  org-mode-hook))
  ;;   (add-hook mode (lambda() (pangu-spacing-mode))))
  )

;; open very larg file
(use-package vlf
  :ensure t)

;; electric-pair-mode alternative 
;; (use-package smartparens
;;   :ensure t
;;   :config
;;   (smartparens-global-mode))
 	
;; (use-package tex
;;   :ensure auctex)

;; (use-package rime
;;   :custom
;;   (default-input-method "rime")
;;   :config
;;   (setq-default rime-show-candidate 'popup))


;; like easymotion
(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-;") 'avy-goto-char)
  (global-set-key (kbd "C-:") 'avy-goto-char-2)
  (global-set-key (kbd "M-g f") 'avy-goto-line))

;; some useful utils
(use-package crux
  :ensure t)

;; (use-package command-log-mode)


(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ;; ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)))


(use-package wgrep
  :ensure t)

(use-package rg
  :ensure t
  :config
  (rg-enable-default-bindings))

(use-package restart-emacs
  :ensure t)

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package editorconfig
  :ensure t
  :diminish
  :config
  (editorconfig-mode 1))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;;(use-package vterm
;;  :ensure t)

;; (use-package multi-vterm
;;  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package visual-fill-column
  :ensure t
  :config
  (setq-default visual-fill-column-center-text t)
  (dolist (mode '(markdown-mode-hook
		  org-mode-hook))
    (add-hook mode (lambda() (visual-line-fill-column-mode))))
  )

(provide 'init-misc)
;;; init-misc.el ends here
