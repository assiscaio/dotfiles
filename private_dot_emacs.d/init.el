;; Registers
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'leuven t)
;; Tamanho da fonte
(set-face-attribute 'default nil :family "JetBrains Mono" :height 110)
(set-register ?e (cons 'file user-init-file))
(set-register ?h (cons 'file "~/.config/hypr/hyprland.conf"))
(load-theme 'leuven)
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     )
	     
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
