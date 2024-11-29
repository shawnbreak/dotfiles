;;; init-gtags --- gtags
;;; Commentary:
;;; Code:

(when (eq system-type 'gnu/linux)
  (load "/usr/share/emacs/site-lisp/global/gtags.el")
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
