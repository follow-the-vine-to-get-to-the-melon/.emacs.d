;;;; Mirror Config
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;;;; Plugins
;;; Third-party
;; Emacs Application Framework
(add-to-list 'load-path "~/.emacs.d/emacs-application-framework")
(require 'eaf)
;; Atom-One
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
(load-theme 'atom-one-dark t)
;;; In Mirror
;; Packages Installation
(defvar my/packages '(
			  ;; Org
			  org
			  ;; Terminal
			  vterm
			  ;; Nice Plugin
			  counsel
			  ivy
			  iedit
			  ;; mode-line
			  spaceline
			  ;; More
			  all-the-icons) "Default packages")
(setq package-selected-packages my/packages) ; Set the packages need to install
(require 'cl) ; The Lisp Extension
(defun my/packages-installed-p()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	(finally (return t)))) ; Define function to return whether package installed
(defun auto-download-plugins()
  (unless (my/packages-installed-p)
    (message "%s" "Refreshing package database")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))) ; Install the packages haven't installed

;; Org
(require 'org)
(setq org-src-fontify-natively t) ; Org code highlight
;; Vterm
(require 'vterm)
;; Counsel
(require 'counsel)
;; Icons
(require 'all-the-icons)
;; Spaceline
(require 'spaceline-config)
(spaceline-spacemacs-theme)
;; ivy
(require 'ivy)
(ivy-mode 1)


;;;; Other config files
;;; GitHub
(load-file "~/.emacs.d/token.el")
(require 'github-token)
;;; Other files
(add-to-list 'load-path "~/.emacs.d/etc/")
;; Org-mode
(require 'init-org)
;; UI
(require 'init-ui)
;; Keymaps
(require 'init-keymaps)
;; Other mode settings
(require 'init-modes)


;;;; Basic things
;;; Functions
(delete-selection-mode 1) ; Delete the seleceted text
(setq make-backup-files nil) ; Don't let Emacs make up backup file
(setq auto-save-default nil) ; Don't auto save the file
(fset 'yes-or-no-p 'y-or-n-p) ; Change the asking's answer way
(setq default-tab-width 2) ; The tab width
;; Open the configuration quickly (Function)
(defun open-config-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-etc-config()
  (interactive)
  (find-file "~/.emacs.d/etc/"))

(defun open-vterm()
  (interactive)
  (vterm)
  (linum-mode -1))


;;; Plugin Setting
;;; Emacs Application Framework
(eaf-setq eaf-browser-remember-history "true")
;; (setq eaf-browser-default-search-engine 'Bing)
(eaf-setq eaf-browser-default-zoom "1.0")
(eaf-setq eaf-browse-blank-page-url "https://cn.bing.com/")
(eaf-setq eaf-browser-dark-mode "true")
;;; Counsel
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-z a") 'counsel-linux-app)
;;; Iedit
(global-set-key (kbd "C-z e") 'iedit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(spaceline all-the-icons counsel vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;; Check if the plugins have installed
(if (file-exists-p "~/.emacs.d/initialized")
    (message "The Plugins have already installed.")
  (auto-download-plugins)
  (make-empty-file "~/.emacs.d/initialized")
  (message "The Plugins have already installed."))
