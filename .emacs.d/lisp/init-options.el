;;; init-options --- options
;;; Commentary:
;;; Code:

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10 )

;; disable ring bell
(setq ring-bell-function 'ignore)

;; sort apropos result by relevancy
(setq apropos-sort-by-scores 1)

(setq-default fill-column 100)
(setq-default show-trailing-whitespace t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-^") 'mode-line-other-buffer)
(global-set-key (kbd "C-o") 'crux-smart-open-line)

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
		vterm-mode-hook
		imenu-list-major-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda ()  (progn
			       (display-line-numbers-mode 0)
			       (visual-line-mode 1)))))

(dolist (mode '(eldoc-mode-hook
		special-mode-hook))
  (add-hook mode (lambda ()  (visual-line-mode 1))))

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font")) ;; Font type & size
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 140)
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font" :height 130)

(defun my-text-scale-reset ()
  (interactive)
  (set-face-attribute 'default nil :height 140)
  (set-face-attribute 'fixed-pitch nil :height 135))

(defun my-text-scale-increase ()
  (interactive)
  (set-face-attribute 'default nil :height (+ (face-attribute 'default :height) 10))
  (set-face-attribute 'fixed-pitch nil :height (+ (face-attribute 'fixed-pitch :height) 10))
  )

(defun my-text-scale-decrease()
  (interactive)
  (set-face-attribute 'default nil :height (- (face-attribute 'default :height) 10))
  (set-face-attribute 'fixed-pitch nil :height (- (face-attribute 'fixed-pitch :height) 10))
  )

(setq frame-inhibit-implied-resize t) ;; 禁止字体变动导致自动调整 Frame 大小
(global-set-key (kbd "C-M-=") 'my-text-scale-increase)
(global-set-key (kbd "C-M--") 'my-text-scale-decrease)
(global-set-key (kbd "C-M-0") 'my-text-scale-reset)

(electric-pair-mode)

(setq backup-directory-alist `(("." . "~/.saves")))

;; recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open)

(setq custom-file "~/.emacs.d/emacs-custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(setq set-mark-command-repeat-pop t)
(setq dired-dwim-target t)

;;;  set default frame size
(defun set-frame-size-according-to-resolution ()
  "Set default frame size."
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
        (add-to-list 'default-frame-alist (cons 'width 100))
      (add-to-list 'default-frame-alist (cons 'width 80)))
    (if (> (x-display-pixel-width) 1280)
        (add-to-list 'default-frame-alist (cons 'height 50))
      (add-to-list 'default-frame-alist (cons 'height 40)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    ;; (add-to-list 'default-frame-alist
    ;;      (cons 'height (/ (- (x-display-pixel-height) 200)
    ;;                       (frame-char-height))))
    )))

(set-frame-size-according-to-resolution)

;; if macos
(if (eq system-type 'darwin)
    (progn
     (menu-bar-mode 1)
     (setq mac-option-key-is-meta nil
	   mac-command-key-is-meta t
	   mac-option-modifier 'none
	   mac-command-modifier 'meta)))


;; typed text replaces the selection if selection is avtive
(delete-selection-mode 1)

;; transparent emacs
;; require emacs 29
(set-frame-parameter nil 'alpha-background 100)
;; (add-to-list 'default-frame-alist '(alpha-background . 70))

;; (global-set-key (kbd "M-n") (kbd "C-u 10 C-n"))
;; (global-set-key (kbd "M-p") (kbd "C-u 10 C-p"))
;; (define-key Info-mode-map (kbd "M-n") (kbd "C-u 10 C-n"))
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(put 'upcase-region 'disabled nil)

(provide 'init-options)
;;; init-options.el ends here
