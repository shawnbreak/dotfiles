;;; basic config
(load "~/.emacs.d/options.el")

;;(load "~/.emacs.d/gtags.el")

;; (add-hook 'gtags-mode-hook
;;   '(lambda ()
;;         ; Local customization (overwrite key mapping)
;;         (define-key gtags-mode-map "\C-f" 'scroll-up)
;;         (define-key gtags-mode-map "\C-b" 'scroll-down)
;; ))
;; (add-hook 'gtags-select-mode-hook
;;   '(lambda ()
;;         (setq hl-line-face 'underline)
;;         (hl-line-mode 1)
;; ))
;; (add-hook 'c-mode-hook
;;   '(lambda ()
;;         (gtags-mode 1)))
;; ; Customization
;; (setq gtags-suggested-key-mapping t)
;; (setq gtags-auto-update t)


;; set package archives for emacs default package manager
(setq package-archives
'(("gnu" . "http://elpa.gnu.org/packages/")
  ("melpa" . "http://melpa.org/packages/")))


;; Set up package.el to work with MELPA
;; (require 'package)
;; (add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
;; (evil-mode 1)

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;;  Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;;  or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ;; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;;  Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-liine)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1)
;;   :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idel-delay 0.2))

(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

(use-package counsel
  :ensure t
  :init
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history)))

(use-package all-the-icons)

(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)

;; general define key
;; (use-package general
;;   ;;(general-evil-setup t)
;;   (general-create-definer rune/learder-keys
;;     :keymaps '(normal insert visual emacs)
;;     :prefix "SPC"
;;     :global-prefix "C-SPC")
;;   (rune/leader-keys
;;    "t" '(:ignore t :which-key "toggles")
;;    "tt" '(counsel-load-theme :which-key "choose theme")))


(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :config
  (setq markdown-fontify-code-blocks-natively t))

(use-package ggtags
  :ensure t)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ;; (XXX-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
(setq lsp-headerline-breadcrumb-enable nil)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode)
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
;;(use-package which-key
;;    :config
;;    (which-key-mode))

(add-hook 'python-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)

(use-package company
  :bind (:map company-active-map
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.3)
  (setq company-tooltip-align-annotations t)
  (global-set-key (kbd "C-c C-/") #'company-files)
  (global-company-mode t))


(use-package company-box
  :hook (company-mode . company-box-mode))


(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


;; lsp mode optimize
(setq gc-cons-threshold (* 1024 1024 100)) ;; 100 MiB
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred


;; use acw-window
(global-set-key (kbd "M-o") 'ace-window)

;; multiple cursors
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(use-package popup-kill-ring
  :ensure t)

(use-package browse-kill-ring
  :ensure t
  :config
  (browse-kill-ring-default-keybindings))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (use-package org-modern
;;   :ensure t
;;   :config
;;   ;; Option 1: Per buffer
;;   (add-hook 'org-mode-hook #'org-modern-mode)
;;   (add-hook 'org-agenda-finalize-hook #'org-modern-agenda))


(use-package imenu-list
  :ensure t)


;; clangd arguments
(setq lsp-clients-clangd-args '("--header-insertion-decorators=0" "--clang-tidy" "--background-index=false"))


(use-package expand-region
  :bind ("C-=" . er/expand-region))


(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-java :ensure nil)
(use-package magit
  :ensure t)

(server-start)

