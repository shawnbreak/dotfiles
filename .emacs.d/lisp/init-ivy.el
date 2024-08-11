;;; init-ivy --- ivy counsel swiper
;;; Commentary:
;;; Code:
(use-package ivy
  :ensure t
  :diminish
  :bind (("C-s" . swiper-thing-at-point)
	 ("C-c C-r" . ivy-resume)
;;	 :map ivy-minibuffer-map
;;	 ("TAB" . ivy-alt-done)
;;	 ("C-l" . ivy-alt-done)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-liine)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode 1))


(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

(use-package counsel
  :ensure t
  :diminish
  :init
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config
  (counsel-mode 1))

(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)

(provide 'init-ivy)
;;; init-ivy.el ends here
