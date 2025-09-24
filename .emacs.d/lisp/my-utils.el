;;; my-utils.el --- emacs lisp util function -*- lexical-binding: t; -*-
;;; author: zhangxin


;;;----------------
;;; my/copy-line
;;;----------------
(defun my/copy-line (arg)
  (interactive "p")
  (kill-ring-save (line-beginning-position)
		  (line-beginning-position (+ 1 arg))))

(global-set-key (kbd "C-c C-l") 'my/copy-line)

;;;-------------------
;;; my/open-init-file
;;;-------------------
(defun my/open-init-file()
  (interactive)
  (find-file user-init-file))

(provide 'my-utils)


;;; my-utils.el end here
