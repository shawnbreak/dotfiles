;;; init-company --- company-mode
;;; Commentary:
;; Code:

(use-package company
  :diminish
  :bind (:map company-active-map
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.3)
  (setq company-tooltip-align-annotations t)
  (setq company-show-quick-access 'left)
  (global-set-key (kbd "C-c C-/") #'company-files)
  (global-set-key (kbd "C-c y") 'company-yasnippet)
  (global-company-mode t))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-/") #'company-complete))

(add-hook 'after-init-hook 'global-company-mode)



(use-package company-box
  :diminish
  :hook (company-mode . company-box-mode))

(provide 'init-company)
;;; init-company.el ends here
