;; Variaveis
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c h") 'hippie-expand)
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
;;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Não exibir mensagem inicial
(setq inhibit-startup-message t)

;; Desabilitar ring-bell (feedback sonoro)
(setq ring-bell-function 'ignore)
;; Modes
;; Não exibir barra de menu
(menu-bar-mode -1)

;; Não exibir barra de ferramentas
(tool-bar-mode -1)

;; Não exibir barra de rolagem
(scroll-bar-mode -1)

;; Modo de arquivos recentes
(recentf-mode 1)

;; Exibir números de linhas
(display-line-numbers-mode t)

(load-theme 'wheatgrass t)

;; Tamanho da fonte
;;(set-face-attribute 'default nil :family "JetBrains Mono" :height 120)
(set-face-attribute 'default nil :family "Consolas" :height 120)

;; Registers
(set-register ?e (cons 'file user-init-file))
(set-register ?h (cons 'file "~/.config/hypr/hyprland.conf"))

;; Configuração de pacotes
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     )
(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
;; Pacote para exibir sugestoes no mini-buffer
(use-package which-key
  :ensure t
  :config (which-key-mode))
;; Pacote para gerenciamento de arquivos e projetos
(use-package projectile
  :ensure t
  :config (projectile-mode))

;; framework para completion do mini-buffer
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Desenvolvimento de Software
(use-package magit
  :ensure t)
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("da4227ca47b0f4f9bddffec324d6d40ecd97a5daaa6d1974020e7284a5f90c81"
     "2d74de1cc32d00b20b347f2d0037b945a4158004f99877630afc034a674e3ab7"
     default))
 '(package-selected-packages '(magit projectile try vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
