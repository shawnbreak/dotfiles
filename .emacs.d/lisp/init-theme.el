;;; init-theme.el --- config color theme
;;; Commentary:
;;; Code:

;; (use-package zenburn-theme
;;   :ensure t
;;   :config
;;   ;; use variable-pitch fonts for some headings and titles
;;   (setq zenburn-use-variable-pitch t)
;;   ;; scale headings in org-mode
;;   (setq zenburn-scale-org-headlines t)
;;   ;; scale headings in outline-mode
;;   (setq zenburn-scale-outline-headlines t))

;; ;; automata theme
;; (use-package autothemer
;;   :ensure t
;;   :config
;;   (load "~/.emacs.d/site-lisp/automata-theme-source-code.el"))


;; doom-themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-org-config)
  (doom-themes-visual-bell-config)
  (load-theme 'doom-monokai-classic t)
  )

(use-package doom-modeline
  :ensure t
  ;; :init (doom-modeline-mode 1)
  )

;; (enable-theme 'automata)
;; (load-theme 'zenburn t)
;; (load-theme 'doom-solarized-dark t)
;; (load-theme 'doom-Iosvkem t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :hook (prog-mode .rainbow-mode))

(use-package all-the-icons)


(defun set-title-bar-dark ()
  "Set title bar dark."
  (interactive)
  (progn
    (set-frame-parameter nil 'ns-appearance 'dark)
    (set-frame-parameter nil 'ns-transparent-titlebar nil)))

(defun set-title-bar-light ()
  "Set title bar light."
  (interactive)
  (progn
    (set-frame-parameter nil 'ns-appearance 'light)
    (set-frame-parameter nil 'ns-transparent-titlebar nil)))

(defun modus-themes-toggle-post ()
  "Run after modus-themes-toggle."
  (interactive)
  (if (member 'modus-operandi custom-enabled-themes)
      (set-title-bar-light)
    (set-title-bar-dark)))

(use-package modus-themes
  :ensure t
  ;; :disabled t
  :config
  (setq modus-themes-mode-line  '(borderless)
	modus-themes-paren-match '(bold)
	;; modus-themes-syntax '(green-strings yellow-comment)
	modus-themes-mixed-fonts t
	modus-themes-bold-constructs t  ;; bold keyword
	modus-themes-italicp-constructs t  ;;  italic comment
	modus-themes-completions

	(quote ((matches . (extrabold))
		(selection . (extrabold accented intense))
		(popup . (accented intense))))

	modus-themes-headings
	'((1 . (variable-pitch 1.5))
	  (2 . (1.3))
	  (3 . (1.2))
	  (agenda-date . (1.3))
	  (agenda-structure . (variable-pitch light 1.8))
	  (t . (1.1)))

	modus-themes-common-palette-overrides
	'(
	  ;; borderless mode line
	  (border-mode-line-active bg-mode-line-active)
          (border-mode-line-inactive bg-mode-line-inactive)
	  )

        ;; dark theme modus-vivendi
	modus-vivendi-palette-overrides
	'(
	  (fg-main "#cdcecf")
	  ;; (bg-main  "#000000")
	  (bg-line-number-inactive "#000000")
	  ;; (bg-main  "#232627")
	  ;; (bg-line-number-inactive "#232627")
	  (bg-line-number-active "#000000")
	  )

	;; light theme modus-operandi
	;; modus-operandi-palette-overrides
	;; '(
	;;   (bg-line-number-inactive "#ffffff")
	;;   )
	)
  ;; (load-theme 'modus-operandi-tinted :no-confirm)
  ;; (set-title-bar-dark)
  (add-hook 'modus-themes-post-load-hook 'modus-themes-toggle-post)
  ;; (define-key global-map (kbd "<f5>") #'modus-themes-toggle)
  )


(provide 'init-theme)
;;; init-theme.el ends here
