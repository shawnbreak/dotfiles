;; basice config
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10 )

 
;; sort apropos result by relevancy
(setq apropos-sort-by-scores 1)


;; relavent to C-x o, switch to other window
(global-set-key (kbd "M-o") 'other-window)

;; directional window selection: S-<left> S-<right> S-<up> S<down>
(windmove-default-keybindings)

;; relative line numbers
(column-number-mode)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; disable line numbers for some mode
(dolist (mode '(org-mode-hook
		markdown-mode-hook
		term-mode-hook
		treemacs-mode-hook
		shell-mode-hook
		eshell-mode-hook_))
  (add-hook mode (lambda ()  (display-line-numbers-mode 0))))

;; (set-face-attribute 'default nil :font "Rec Mono Custom" :height 120)
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 120)

(electric-pair-mode)

(setq backup-directory-alist `(("." . "~/.saves")))

;; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)


(setq set-mark-command-repeat-pop t)
