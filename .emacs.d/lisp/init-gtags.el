;;; init-gtags --- gtags
;;; Commentary:
;;; Code:

(when (eq system-type 'gnu/linux)
  (let ((gtags-file-1 "/usr/share/emacs/site-lisp/gtags.el")
	(gtags-file-2 "/usr/share/emacs/site-lisp/global/gtags.el"))
    (cond ((file-exists-p gtags-file-1) (load gtags-file-1))
	  ((file-exists-p gtags-file-2) (load gtags-file-2))
	  (t (message "no gtags.el found")))
    )
  (require 'gtags)
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(gtags-mode 1))))
  )

(defun my/with-vertico-disabled (orig-fn &rest args)
  "Temporarily disable Vertico during the execution of a Gtags command."
  (let ((vertico-mode-active vertico-mode))
    (vertico-mode -1)
    (unwind-protect
        (apply orig-fn args)
      (when vertico-mode-active
        (vertico-mode 1)))))

(dolist (fn '(gtags-find-tag
              gtags-find-rtag
              gtags-find-symbol
              gtags-find-with-grep
              gtags-find-pattern))
  (advice-add fn :around #'my/with-vertico-disabled))


(provide 'init-gtags)
;;; init-gtags.el ends here
