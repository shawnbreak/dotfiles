;;; md-download -- md downlaod  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(defgroup md-download nil
  "Imgae drag and drop for markdown-mode."
  :group 'md
  :prefix "md-download-")

(defcustom md-download-screenshot-method "gnome-screenshot -a -f %s"
  "The tool to capture screenshots."
  :type '(choice
          (const :tag "gnome-screenshot" "gnome-screenshot -a -f %s")
          (const :tag "scrot" "scrot -s %s")
          (const :tag "flameshot" "flameshot gui --raw > %s")
          (const :tag "gm" "gm import %s")
          (const :tag "imagemagick/import" "import %s")
          (const :tag "imagemagick/import + xclip to save to clipboard"
           "export filename=\"%s\"; import png:\"$filename\" ;xclip -selection clipboard -target image/png -filter < \"$filename\" &>/dev/null")
          (const :tag "xfce4-screenshooter" "xfce4-screenshooter -r -o cat > %s")
          ;; screenshot method in ms-windows, /capture=4 stands for interactive.
          (const :tag "IrfanView" "i_view64 /capture=4 /convert=\"%s\"")
          ;; screenshot script in osx, -i stands for interactive,
          ;; press space key to toggle between selection and
          ;; window/application mode.
          (const :tag "screencapture" "screencapture -i %s")
          ;; KDE screenshot application
          (const :tag "spectacle" "spectacle -br -o %s")
          ;; take an image that is already on the clipboard, for Linux
          (const :tag "xclip"
           "xclip -selection clipboard -t image/png -o > %s")
          ;; take an image that is already on the clipboard, for Windows
          (const :tag "imagemagick/convert" "convert clipboard: %s")
          ; capture region, for Wayland
          (const :tag "grim + slurp" "grim -g \"$(slurp)\" %s")
          (function :tag "Custom function")))


(defun md-download-clipboard (&optional basename)
  "Capture the image from the clipboard and insert the resulting file."
  (interactive)
  (let ((md-download-screenshot-method
         (cl-case system-type
           (gnu/linux
            (if (string= "wayland" (getenv "XDG_SESSION_TYPE"))
                (if (executable-find "wl-paste")
                    "wl-paste -t image/png > %s"
                  (user-error
                   "Please install the \"wl-paste\" program included in wl-clipboard"))
              (if (executable-find "xclip")
                  "xclip -selection clipboard -t image/png -o > %s"
                (user-error
                 "Please install the \"xclip\" program"))))
           ((windows-nt cygwin)
            (if (executable-find "convert")
                "convert clipboard: %s"
              (user-error
               "Please install the \"convert\" program included in ImageMagick")))
           ((darwin berkeley-unix)
            (if (executable-find "pngpaste")
                "pngpaste %s"
              (user-error
               "Please install the \"pngpaste\" program from Homebrew.")))))
	(md-download-filename
	 (concat "./assets/"
		 (format-time-string "screenshot_%Y-%m-%d-%H-%M-%S.png"))))
    (make-directory "./assets" t)
    (shell-command-to-string
     (format md-download-screenshot-method md-download-filename))
    (insert (format "![](%s)" md-download-filename))
    (markdown-display-inline-images)))




;; (defun md-download-rename-at-point ()
;;   "Rename image at point."
;;   (interactive)
;;   (let* ((dir-path (org-download--dir))
;;          (current-name (file-name-nondirectory
;;                         (org-element-property :path (org-element-context))))
;;          (current-path (concat dir-path "/" current-name))
;;          (ext (file-name-extension current-name))
;;          (new-name (read-string "Rename file at point to: " (file-name-sans-extension current-name)))
;;          (new-path (concat dir-path "/" new-name "." ext)))
;;     (rename-file current-path new-path)
;;     (message "File successfully renamed...")
;;     (org-download-replace-all current-name (concat new-name "." ext))))

(provide 'md-download)
;;; md-download.el ends here
