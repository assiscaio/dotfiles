;; Variaveis
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c h") 'hippie-expand)
(global-set-key (kbd "C-c f") 'recentf-open-files)
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

;; Tamanho da fonte
;;(set-face-attribute 'default nil :family "JetBrains Mono" :height 120)
;; (set-face-attribute 'default nil :family "MesloLGL Nerd Font" :height 120)
;; (set-face-attribute 'default nil :family "Consolas" :height 120)
;; (set-face-attribute 'default nil :family "RobotoMono Nerd Font Mono" :height 120)
(set-face-attribute 'default nil :family "Iosevka NFM" :height 120 :weight 'semi-bold)

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

;; Pacote de temas
(use-package ef-themes
  :ensure t)
  
(load-theme 'ef-reverie t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("19b62f442479efd3ca4c1cef81c2311579a98bbc0f3684b49cdf9321bd5dfdbf"
     "b9c002dc827fb75b825da3311935c9f505d48d7ee48f470f0aa7ac5d2a595ab2"
     "ac893acecb0f1cf2b6ccea5c70ea97516c13c2b80c07f3292c21d6eb0cb45239"
     "e85a354f77ae6c2e47667370a8beddf02e8772a02e1f7edb7089e793f4762a45"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
