;;; basic config
(load "~/.emacs.d/lisp/options.el")

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

0
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

;; (use-package org-bullets
;;   :ensure t
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-superstar
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
  (setq org-superstar-leading-bullet ?\s))

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
  :bind ("C-=" . er/expand-region)
  ("C--". er/contract-region))


(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-java :ensure nil)
(use-package magit
  :ensure t)

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

(use-package org-download
  :ensure t
  ;; Drag-and-drop to `dired`
  :config
  (setq-default org-download-image-dir "./assets")
  (setq-default org-download-heading-lvl nil)
  (add-hook 'dired-mode-hook 'org-download-enable))

(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)

(use-package rime
  :custom
  (default-input-method "rime"))

(setq-default org-startup-with-inline-images t)


;; treemacs config
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-files-by-mouse-dragging    t
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

;; (use-package treemacs-evil
;;   :after (treemacs evil)
;;   :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

(use-package treemacs-nerd-icons
  :config
  (treemacs-load-theme "nerd-icons"))
;;(treemacs-start-on-boot)

(server-start)
