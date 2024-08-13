;;; init-elpa --- init elpa
;;; Commentary:

;;; Code:
;; set package archives for emacs default package manager
;; (setq package-archives
;; '(("gnu" . "http://elpa.gnu.org/packages/")
;;   ("melpa" . "http://melpa.org/packages/")))

(setq package-archives
      '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; Set up package.el to work with MELPA
;; (require 'package)
;; (add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)


(provide 'init-elpa)
;;; init-elpa.el ends here
