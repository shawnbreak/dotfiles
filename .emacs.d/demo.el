;; Learn write some emacs lisp code

(defun my/insert-current-time()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun my/replace-current-buffer(from to)
  (interactive
   (list (read-string "From: ")
	 (read-string "To: ")))
  (save-excursion
    (goto-char (point-min))
    (while (search-forward from nil t)
      (replace-match to))))

(defun my/show-selected-text()
  "show selected content"
  (interactive)
  (if (use-region-p)
      (message "selected content: %s"
	       (buffer-substring (region-beginning) (region-end)))
    (message "no selected content")))

(defun my/random-motivation ()
  "显示随机励志语录。"
  (interactive)
  (let ((quotes '("代码写多了，bug 会自己长出来。"
                  "别怕出错，出错是成长的开始。"
                  "今天不写代码，明天写两倍。"
                  "bug 只是暂时的，commit 是永恒的。"
                  "少抱怨，多写代码。")))
    (message "%s" (nth (random (length quotes)) quotes))))


(defun my/write-mode()
  "开启或关闭沉浸式写作模式"
  (interactive)
  (if (bound-and-true-p writing-mode-enabled)
      (progn
	(menu-bar-mode 1)
	(tool-bar-mode 1)
	(scroll-bar-mode 1)
	(setq writing-mode-enabled nil)
	(message "退出写作模式"))
    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    (setq writing-mode-enabled 1)
    (message "进入写作模式")))

(defun my/random-background ()
  (interactive)
  (set-background-color
   (format "#%06x" (random #xFFFFFF))))

(defun my/white-background ()
  "默认白色背景"
  (interactive)
  (set-background-color "White"))


(defun my/translate-to-chinese (text)
  (interactive "s要翻译的内容：")
  (shell-command (format "trans: zh %s" (shell-quote-argument text))))

(defun my/pomodoro-start ()
  (interactive)
  (run-at-time "25 min" nil
	       (lambda () (messagee "⏰ 番茄钟时间到！休息一下吧。")))
  (message "🍅 番茄钟已启动"))


(defun snowflakes ()
  "在当前 buffer 随机显示雪花效果。"
  (interactive)
  (dotimes (_ 50)
    (goto-char (random (point-max)))
    (insert (propertize "*" 'face '(:foreground "white")))
    (sit-for 0.05)))




