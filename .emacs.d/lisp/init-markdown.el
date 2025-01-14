;;; init-markdown --- markdown mode
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :ensure t
  :custom
  (markdown-hide-urls t)
  ;; (markdown-hide-markup t)
  (markdown-enable-math t)
  ;; :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "pandoc")
  :config
  (setq markdown-max-image-size '(1000 . 800))
  (setq markdown-fontify-code-blocks-natively t)
  (add-hook 'markdown-mode-hook  (lambda() (markdown-display-inline-images)))
  (require 'markdown-mode)
  (set-face-attribute 'markdown-header-face-1 nil :height 1.8)
  (set-face-attribute 'markdown-header-face-2 nil :height 1.5)
  (set-face-attribute 'markdown-header-face-3 nil :height 1.2)
  )



(defun my/markdown-number-headings ()
  "Automatically number headings in Markdown while preserving the '#' symbols."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((counters (make-vector 6 0)))
      (while (re-search-forward "^\\(#+\\) \\(.*\\)$" nil t)
        (let* ((level (- (match-end 1) (match-beginning 1)))
               (counter (1+ (aref counters (1- level)))))
	  (message "head level: %s, counter: %s" level counter)
          (aset counters (1- level) counter)
          (dotimes (i (- 6 level))
            (aset counters (+ i level) 0))
          (replace-match
           (format "%s %s %s"
                   (match-string 1)
                   (mapconcat #'number-to-string
                              (cl-loop for i from 0 below level
				       collect (aref counters i))
                              ".")
                   (match-string 2))
           t t))))))


(defun my/markdown-remove-heading-numbers ()
  "Remove numbering from headings in Markdown."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^\\(#+\\) \\([0-9]+\\.*\\)+ *\\(.*\\)$" nil t)
      (replace-match
       (format "%s %s"
               (match-string 1)
               (match-string 3))

       t t))))

(provide 'init-markdown)
;;; init-markdown.el ends here
