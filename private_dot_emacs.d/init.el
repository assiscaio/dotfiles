; Variaveis e Hooks
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c h") 'hippie-expand)
(global-set-key (kbd "C-c f") 'recentf-open-files)
(add-hook 'after-init-hook 'global-company-mode)

;; Não exibir mensagem inicial
(setq inhibit-startup-message t)
;; TAB
(setq-default tab-width 4)
;; Deletar seleção com DELETE / C-d
(delete-selection-mode t)
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
;;(display-line-numbers-mode t)

;; Tamanho da fonte
;;(set-face-attribute 'default nil :family "JetBrains Mono" :height 120)
;; (set-face-attribute 'default nil :family "MesloLGL Nerd Font" :height 120)
;; (set-face-attribute 'default nil :family "Consolas" :height 120)
;; (set-face-attribute 'default nil :family "RobotoMono Nerd Font Mono" :height 120)
(set-face-attribute 'default nil :family "Iosevka NFM" :height 120 :weight 'semi-bold)

;; Registers
;; (set-register ?e (cons 'file user-init-file))

;; Configuração de pacotes
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     )
(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
;; "VIM-Easymotion"
(use-package avy
  :ensure t
  :bind (
  ("C-c c" . 'avy-goto-char)
  ("C-c C-c" . 'avy-goto-char-2) ))

;; Pacote para exibir sugestoes no mini-buffer
(use-package which-key
  :ensure t
  :config (which-key-mode))
;; Pacote para gerenciamento de arquivos e projetos
(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '( ("C:/cpog-src/" . 1)))
  (projectile-discover-projects-in-search-path)
  :bind
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode +1))

;; framework para completion do mini-buffer
(use-package vertico
  :ensure t
  :init
  (vertico-mode +1))

;; Desenvolvimento de Software [DEV]
(use-package magit
  :ensure t)

(use-package restclient
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))

;; LSP
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
		 (kotlin-mode . lsp)
		 (angular-mode . lsp)
		 ((typescript-ts-mode js-ts-mode) . lsp-deferred)
		 (lsp-mode . lsp-enable-which-key-integration) )
  :commands lsp)
(use-package lsp-ui
  :commands
  (lsp-ui-mode
   lsp-ui-doc-show
   lsp-ui-doc-glance)
  :bind (:map lsp-mode-map
			  ("C-c C-d" . 'lsp-ui-doc-glance))
  :config (setq lsp-ui-doc-enable t
				lsp-ui-doc-show-with-cursor t
				lsp-ui-doc-include-signature t
				lsp-ui-doc-position 'at-point)
  :ensure t)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)
(use-package company
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package dap-mode
  :ensure t)

;; Pacote de temas
(use-package ef-themes
  :ensure t)

(load-theme 'ef-cyprus t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ae20535e46a88faea5d65775ca5510c7385cbf334dfa7dde93c0cd22ed663ba0"
	 "19b62f442479efd3ca4c1cef81c2311579a98bbc0f3684b49cdf9321bd5dfdbf"
	 "b9c002dc827fb75b825da3311935c9f505d48d7ee48f470f0aa7ac5d2a595ab2"
	 "ac893acecb0f1cf2b6ccea5c70ea97516c13c2b80c07f3292c21d6eb0cb45239"
	 "e85a354f77ae6c2e47667370a8beddf02e8772a02e1f7edb7089e793f4762a45"
	 default))
 '(package-selected-packages
   '(company dap-mode ef-themes flycheck lsp-mode lsp-treemacs lsp-ui
			 magit projectile restclient tree-sitter tree-sitter-langs
			 try vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
