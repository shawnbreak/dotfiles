;;; custome-default-theme.el --- Custom default theme




(deftheme custom-default
  "custom default theme")

;; Please, install rainbow-mode.
;; Colors with +x are lighter. Colors with -x are darker.
;; (let ((gruber-darker-fg        "#e4e4ef")
(let ((gruber-darker-fg        "#BFC7D5")
      (gruber-darker-fg+1      "#f4f4ff")
      (gruber-darker-fg+2      "#f5f5f5")
      (gruber-darker-white     "#ffffff")
      (gruber-darker-black     "#000000")
      (gruber-darker-bg-1      "#101010")
      (gruber-darker-bg        "#181818")
      (gruber-darker-bg+1      "#282828")
      (gruber-darker-bg+2      "#453d41")
      (gruber-darker-bg+3      "#484848")
      (gruber-darker-bg+4      "#52494e")
      (gruber-darker-red-1     "#c73c3f")
      (gruber-darker-red       "#f43841")
      (gruber-darker-red+1     "#ff4f58")
      (gruber-darker-green     "#73c936")
      (gruber-darker-yellow    "#ffdd33")
      (gruber-darker-brown     "#cc8c3c")
      (gruber-darker-quartz    "#95a99f")
      (gruber-darker-niagara-2 "#303540")
      (gruber-darker-niagara-1 "#565f73")
      (gruber-darker-niagara   "#96a6c8")
      (gruber-darker-wisteria  "#9e95c7")
      (custom-bg+1 "#e8e8e8")
      (custom-bg+2 "#f0f0f0")
      )
  (custom-theme-set-variables
   'custom-default
   '(frame-brackground-mode (quote light)))

  (custom-theme-set-faces
   'custom-default

   ;; Markdown
   `(markdown-code-face ((t (:background ,custom-bg+2 :extend t))))
   `(markdown-pre-face ((t (:inherit 'markdown-code-face))))
   `(markdown-inline-code-face ((t (:background ,custom-bg+1))))
         
   ;; Org Mode
   `(org-block ((t (:background ,custom-bg+2 :extend t))))
   `(org-block-begin-line ((t (:background ,custom-bg+1 :extend t))))
   `(org-block-end-line ((t (:background ,custom-bg+1 :extend t))))

   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'custom-default)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; custom-default-theme.el ends here.
