(setq custom-file (locate-user-emacs-file "custom.el"))

(pinentry-start)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode 1)
(global-display-line-numbers-mode 1)

(load-theme 'modus-vivendi t)
(add-to-list 'default-frame-alist '(font . "Iosevka-16"))

(load custom-file t)
