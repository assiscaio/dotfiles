;; -*- lexical-binding: t; -*-
(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org") t)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa"  . "https://elpa.gnu.org/packages/")))
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

;; Evil Mode
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(with-eval-after-load 'evil
  (setq evil-symbol-word-search t))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(with-eval-after-load 'evil
  (define-key evil-window-map (kbd "h") 'evil-window-left)
  (define-key evil-window-map (kbd "j") 'evil-window-down)
  (define-key evil-window-map (kbd "k") 'evil-window-up)
  (define-key evil-window-map (kbd "l") 'evil-window-right)
  (define-key evil-motion-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-motion-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-motion-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-motion-state-map (kbd "C-l") 'evil-window-right))

(use-package evil-surround
  :ensure t
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-snipe
  :ensure t
  :after evil
  :custom
  (evil-snipe-scope 'buffer)
  :config
  (evil-snipe-mode 1))

(use-package evil-easymotion
  :ensure t
  :after (evil avy)
  :config
  (evil-default-keybinding "s"))

(use-package general
  :after evil
  :config
  (general-evil-setup)

(general-create-definer my-leader-def
			:states '(normal visual motion)
			:keymaps 'override
			:prefix "SPC")

(my-leader-def
  "t"     '(:ignore t :which-key "terminais/toggles")
  "tt"    '(vterm :which-key "abrir vterm")
  "q"     '(:ignore t :which-key "sair/reiniciar")
  "qq"    '(kill-emacs :which-key "fechar o emacs")
  "f"     '(:ignore t :which-key "arquivos")
  "ff"    '(find-file :which-key "abrir arquivo")
  "fs"    '(save-buffer :which-key "salvar-arquivo")
  "fR"    '((lambda () (interactive) (load-file user-init-file)) :which-key "recarregar init.el")
  "b"     '(:ignore t :which-key "buffers")
  "bb"    '(switch-to-buffer :which-key "trocar buffer")
  "bk"    '(kill-current-buffer :which-key "fechar buffer")
  "w"     '(:ignore t :which-key "janelas")
  "wd"    '(delete-window :which-key "fechar janela")
  "w-"    '(split-window-below :which-key "dividir horizontalmente")
  "w/"    '(split-window-right :which-key "dividir verticalmente")
  "g"     '(:ignore t :which-key "git")
  "gg"    '(magit-status :which-key "magit status")
  "m"     '(:ignore t :which-key "clojure/local")
  "m'"    '(cider-jack-in :which-key "Iniciar REPL (Jack-in)")
  "me"    '(:ignore t :which-key "avaliar (eval)")
  "meb"   '(cider-eval-buffer :which-key "avaliar buffer inteiro")
  "mer"   '(cider-eval-region :which-key "avaliar seleção (region)")
  "mes"   '(cider-eval-last-sexp :which-key "avaliar expressão anterior (C-x C-e)")
  ))

;; Clojure
(use-package clojure-mode)
(use-package cider
  :after clojure-mode
  :config
  (setq cider-repl-pop-to-buffer-on-connect nil))

(add-hook 'clojure-mode-hook 'eglot-ensure)

;; Pacotes gerais
(use-package vertico
  :init
  (vertico-mode 1))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode 1))

(use-package which-key
  :config
  (which-key-mode))

(use-package magit)
(use-package projectile
  :init
  (projectile-mode 1)
  :config
  (my-leader-def
    "p"    '(:ignore t :which-key "projetos")
    "pp"   '(projectile-switch-project :which-key "trocar de project")
    "pf"   '(projectile-find-file :which-key "buscar arquivo no projeto")
    "p/"   '(projectile-ripgrep :which-key "buscar texto no projeto")))
(use-package smartparens
  :hook (clojure-mode . smartparens-mode)
  :config
  (require 'smartparens-config))
(use-package nerd-icons)
(use-package doom-modeline
  :after nerd-icons
  :init (doom-modeline-mode 1))
(use-package vterm)
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

;; Config basica

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(cider doom-modeline doom-themes evil-collection evil-easymotion
	   evil-snipe evil-surround general magit marginalia orderless
	   projectile smartparens vertico vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
