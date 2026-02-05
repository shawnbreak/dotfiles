;; options
(setq custom-file "~/.emacs.d/custom-file.el")
(when (file-exists-p custom-file)
  (load-file custom-file))

(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(global-display-line-numbers-mode)
(savehist-mode 1)
(setq display-line-numbers-type 'relative) ; 't 'relative
(setq show-trailing-whitespace t)
(windmove-default-keybindings)
(delete-selection-mode 1)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq c-basic-offset 4)

(put 'upcase-region 'disabled nil)  ; C-x C-u 
(put 'downcase-region 'disabled nil)  ; C-x C-l

;; Meta key is CMD on macOS
(setq mac-option-modifier nil)
(setq mac-command-modifier 'meta)

(set-face-attribute 'default nil :family "Annotation Mono" :height 160)
(set-face-attribute 'fixed-pitch nil :family "Annotation Mono" :height 160)
(dolist (face '(fixed-pitch
                fixed-pitch-serif
                variable-pitch
                tooltip
                mode-line
                mode-line-inactive
                header-line
                minibuffer-prompt))
  (set-face-attribute face nil
                      :family "Annotation Mono"))
(set-fontset-font t 'han (font-spec :family "LXGW WenKai Mono"))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "C-x C-r") 'recentf)
(global-set-key (kbd "M-j") 'delete-indentation)
(global-set-key (kbd "C-c h") 'eldoc)
(global-set-key (kbd "M-s s") 'grep)
(global-set-key (kbd "M-s M-s") 'consult-ripgrep)
(global-set-key (kbd "M-g i") 'consult-imenu)
(global-set-key (kbd "C-c r") 'eglot-rename)
(global-set-key (kbd "C-c a") 'eglot-code-actions)
(global-set-key (kbd "C-c c") 'compile)
;; (global-set-key (kbd "C-<return>") 'execute-extended-command)


(global-set-key (kbd "C-c f") 'eglot-format)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)
(global-set-key (kbd "S-C-<up>") 'shrink-window)

(global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)

(global-eldoc-mode -1)

;; ================ org mode config ================
(setq org-directory "~/org")
(setq org-default-notes-file "~/org/inbox.org")

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(d)" "|" "DONE(x)")))

(setq org-agenda-files
      '("~/org"))

;; ================ org mode config end ================

;; packages

(setq package-archives
      '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package gruber-darker-theme
  :ensure t
  :config
  (load-theme 'gruber-darker t))

(use-package crux
  :ensure t)

(use-package projectile
  :ensure t)

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region))

(use-package magit
  :ensure t)

(use-package diff-hl :ensure t
  :hook ((prog-mode . diff-hl-mode)
	 (dired-mode . diff-hl-dired-mode))
  :config (diff-hl-flydiff-mode 1))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package embark
  :ensure t
  :config
  (global-set-key (kbd "C-.") 'embark-act))
(use-package embark-consult
  :ensure t)


(use-package consult :ensure t)

(use-package eglot
  :ensure t
  :init
  (setq eglot-ignored-server-capabilities '(:inlayHintProvider))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'rust-mode-hook 'eglot-ensure)
  (add-hook 'zig-mode-hook 'eglot-ensure)
  :config
  (setq-default eglot-inlay-hints-mode 0))

(add-hook 'eglot-managed-mode-hook
	  (lambda ()
	    (eldoc-mode -1)))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :config
  (setq corfu-auto t
	corfu-auto-delay 0.2
	))

(use-package markdown-mode
  :ensure t
  :config
  (set-face-attribute 'markdown-header-face-1 nil :height 1.8)
  (set-face-attribute 'markdown-header-face-2 nil :height 1.5)
  (set-face-attribute 'markdown-header-face-3 nil :height 1.2)
  (setq markdown-image-default-attributes '((width . "600") (height . "400"))))

(use-package visual-fill-column :ensure t)
(use-package pyvenv :ensure t)
(use-package ggtags :ensure t)
(use-package rust-mode :ensure t)
(use-package zig-mode :ensure t)

;; utils

(defun my/md-download-clipboard (image_name)
  "Capture the image from the clipboard and insert the resulting file."
  (interactive "Mimage_name: ")
  (let ((md-download-screenshot-method
         (cl-case system-type
           (gnu/linux
            (if (string= "wayland" (getenv "XDG_SESSION_TYPE"))
                (if (executable-find "wl-paste")
                    "wl-paste -t image/png > %s"
                  (user-error
                   "Please install the \"wl-paste\" program included in wl-clipboard"))
              (if (executable-find "xclip")
                  "xclip -selection clipboard -t image/png -o > %s"
                (user-error
                 "Please install the \"xclip\" program"))))
           ((windows-nt cygwin)
            (if (executable-find "convert")
                "convert clipboard: %s"
              (user-error
               "Please install the \"convert\" program included in ImageMagick")))
           ((darwin berkeley-unix)
            (if (executable-find "pngpaste")
                "pngpaste %s"
              (user-error
               "Please install the \"pngpaste\" program from Homebrew.")))))
	(md-download-dir (concat "./assets/" (file-name-base buffer-file-name)))
	(md-download-filename
	 (concat "./assets/" (file-name-base buffer-file-name) "/" image_name ".png")))
    (make-directory md-download-dir t)
    (shell-command-to-string
     (format md-download-screenshot-method md-download-filename))
    (insert (format "![](%s)" md-download-filename))
    (markdown-display-inline-images)))

(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "C-c i") #'my/md-download-clipboard))

(setq-default visual-fill-column-center-text t)
(defun my/markdown-preview ()
  (interactive)
  (display-line-numbers-mode -1)
  (visual-fill-column-mode 1)
  (markdown-toggle-markup-hiding 1)
  (markdown-toggle-url-hiding 1))
(defun my/markdown-preview-off ()
  (interactive)
  (display-line-numbers-mode 1)
  (visual-fill-column-mode -1)
  (markdown-toggle-markup-hiding -1)
  (markdown-toggle-url-hiding -1))
