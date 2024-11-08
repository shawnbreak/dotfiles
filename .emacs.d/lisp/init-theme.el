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
;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   ;; (load-theme 'doom-one t)
;; 
;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
;;   ;;  Enable custom neotree theme (all-the-icons must be installed!)
;;   ;; (doom-themes-neotree-config)
;;   ;;  or for treemacs users
;;   ;; (setq doom-themes-treemacs-theme "doom-atom") ;; use "doom-colors" for less minimal icon theme
;;   ;; (doom-themes-treemacs-config)
;;   ;;  Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1)
;;   :custom ((doom-modeline-height 15)))


;; (enable-theme 'automata)
;; (load-theme 'zenburn t)
;; (load-theme 'doom-solarized-dark t)
;; (load-theme 'doom-Iosvkem t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package all-the-icons)

(use-package modus-themes
  :ensure t
  :config
  ;; config modus themes
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
	  (t . (1.1))))
  )

(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

(setq modus-themes-common-palette-overrides
      '(
	;; borderless mode line
	(border-mode-line-active bg-mode-line-active)
        (border-mode-line-inactive bg-mode-line-inactive)
	))

(setq modus-vivendi-palette-overrides
      '(
	(fg-main "#cccccc")
	))

(load-theme 'modus-vivendi :no-confirm)

(provide 'init-theme)
;;; init-theme.el ends here
