;;; init-org --- org mode
;;; Commentary:
;;; Code:

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

(use-package org-download
  :ensure t
  ;; Drag-and-drop to `dired`
  :config
  (setq-default org-download-image-dir "./assets")
  (setq-default org-download-heading-lvl nil)
  (add-hook 'dired-mode-hook 'org-download-enable))

(setq-default org-startup-with-inline-images t)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))


(require 'org)
(set-face-attribute 'org-level-1 nil :height 1.8)
(set-face-attribute 'org-level-2 nil :height 1.5)
(set-face-attribute 'org-level-3 nil :height 1.2)




(provide 'init-org)
;;; init-org.el ends here
