(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      auto-save-file-name-transforms `((".*" ,(concat user-emacs-directory "auto-save/") t))
      display-line-numbers-type 'relative
      inhibit-startup-screen t)

(let ((auto-save-dir (concat user-emacs-directory "auto-save/")))
  (unless (file-exists-p auto-save-dir)
    (make-directory auto-save-dir t)))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(fido-mode 1)
(global-display-line-numbers-mode 1)

(load-theme 'modus-vivendi t)
(add-to-list 'default-frame-alist '(font . "Iosevka-16"))

(when (fboundp 'pinentry-start) (pinentry-start))
