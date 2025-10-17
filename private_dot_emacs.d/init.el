;; Variaveis
(global-set-key (kbd "C-c h") 'hippie-expand)

;; Não exibir mensagem inicial
(setq inhibit-startup-message t)

;; Não exibir barra de menu
(menu-bar-mode -1)

;; Não exibir barra de ferramentas
(tool-bar-mode -1)

;; Não exibir barra de rolagem
(scroll-bar-mode -1)

;; Modo de arquivos recentes
(recentf-mode 1)


(load-theme 'leuven t)

;; Tamanho da fonte
(set-face-attribute 'default nil :family "JetBrains Mono" :height 110)

;; Registers
(set-register ?e (cons 'file user-init-file))
(set-register ?h (cons 'file "~/.config/hypr/hyprland.conf"))

;; Configuração de pacotes
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     )
(require 'package)
(setq package-enable-at-startup nil)
;;(setq use-package-always-ensure t)
(package-initialize)
;;(package-refresh-contents)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


(load-theme 'leuven)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2d74de1cc32d00b20b347f2d0037b945a4158004f99877630afc034a674e3ab7"
     default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
