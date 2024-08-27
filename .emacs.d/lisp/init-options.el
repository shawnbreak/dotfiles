;;; init-options --- options
;;; Commentary:
;;; Code:

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

(set-face-attribute 'default nil :font "Rec Mono Custom4" :height 140)
(set-face-attribute 'fixed-pitch nil :font "Rec Mono Custom4" :height 140)

;; (electric-pair-mode)

(setq backup-directory-alist `(("." . "~/.saves")))

;; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

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
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 200)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)

(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-option-modifier 'none
      mac-command-modifier 'meta)


;; typed text replaces the selection if selection is avtive
(delete-selection-mode 1)

;; transparent emacs
;; require emacs 29
;; (set-frame-parameter nil 'alpha-background 90)
;; (add-to-list 'default-frame-alist '(alpha-background . 70))

(defun toggle-transpraent-background ()
  "Toggle transparent background."
  (interactive)
  ())

(global-set-key (kbd "M-n") (kbd "C-u 10 C-n"))
(global-set-key (kbd "M-p") (kbd "C-u 10 C-p"))
(define-key Info-mode-map (kbd "M-n") (kbd "C-u 10 C-n"))

(put 'upcase-region 'disabled nil)

(provide 'init-options)
;;; init-options.el ends here
