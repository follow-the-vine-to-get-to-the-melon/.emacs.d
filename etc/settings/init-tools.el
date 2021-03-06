;;;; This file is the tools of my configuration.

;;; Third-party
;;; Emacs Application Framework
(package-require eaf
	:load-path "~/.emacs.d/third-party/emacs-application-framework"
	:key (("C-q C-w l" . eaf-open-browser)
				("C-q C-w h" . eaf-open-browser-with-history)
				("C-q C-m b" . eaf-open-bookmark))
	:config (progn
						(eaf-setq eaf-browser-remember-history "true")
						(eaf-setq eaf-browser-default-zoom "1.1")
						(defun eaf-browser-set (&optional day)
							(interactive)
							(if (null day)
									(if (day-or-night)
											(eaf-setq eaf-browser-dark-mode "false")
										(eaf-setq eaf-browser-dark-mode "true"))
								(pcase day
									("day" (eaf-setq eaf-browser-dark-mode "false"))
									("night" (eaf-setq eaf-browser-dark-mode "true")))))
						(eaf-browser-set))
	:hook (eaf-mode-hook . (lambda () (evil-change-state 'emacs)
													 (setq-local awesome-tray-active-modules '("input-method" "mode-name" "date")))))

;;; English Teacher
(package-require english-teacher
	:repo "loyalpartner/english-teacher.el"
	:key (("C-' C-l" . english-teacher-smart-translation)
				("C-' T" . english-teacher-follow-mode))
	:var ((english-teacher-backend . 'baidu)
				(english-teacher-show-result-function . 'english-teacher-eldoc-show-result-function))
	:hook ((Info-mode-hook eww-mode-hook help-mode-hook) . english-teacher-follow-mode))

;;; Netease Cloud Music
(package-require async)
(package-require request)
(package-require netease-cloud-music
	:repo ("SpringHan/netease-cloud-music.el" :depth nil)
	:key (("C-' C-m t" . netease-cloud-music)
				("C-' C-m r" . netease-cloud-music-change-repeat-mode)))

;;; Shengci.el
(package-require shengci
	:repo "EvanMeek/shengci.el")


;;; Dashboard
(package-require dashboard
	:var ((dashboard-banner-logo-title . "Live in Emacs!")
				(dashboard-startup-banner . 'logo)
				(dashboard-center-content . t)
				(dashboard-set-heading-icons . t)
				(dashboard-set-navigator . t)
				(dashboard-init-info . "SpringHan Emacs"))
	:config (dashboard-setup-startup-hook))

;;; Counsel
(package-require counsel
	:key (("M-x" . counsel-M-x)
				("C-x C-f" . counsel-find-file)
				("C-q a" . counsel-linux-app)))

;;; Counsel-etags
(package-require counsel-etags
	:key ("C-]" . counsel-etags-find-tag-at-point))

;;; Icons
(package-require all-the-icons
	:key ("C-' C-i" . all-the-icons-insert))

;;; ivy
(package-require posframe
	:var (posframe-mouse-banish . nil))
(package-require ivy
	:hook (after-init-hook . ivy-mode)
	:key (("C-s" . swiper)
				("C-r" . swiper-backward)
				("C-- s" . swiper-all)))
(package-require ivy-posframe
	:hook (ivy-mode-hook . ivy-posframe-mode)
	:var ((ivy-posframe-display-functions-alist . '((t . ivy-posframe-display-at-frame-center)))
				(ivy-posframe-parameters . '((left-fringe . 8) (right-fringe . 8)))))

;;; Bongo
(package-require bongo)

;;; Which Key
(package-require which-key
	:hook (after-init-hook . which-key-mode))

;;; ace window
(package-require ace-window
	:key ("C-' C-c" . ace-window))

;;; Calendar-China
(package-require cal-china-x)

;;; Iedit
(package-require iedit
	:key ("C-' C-e" . iedit-mode))

;;; hungry-delete
(package-require hungry-delete
	:key (("C-' C-h" . hungry-delete-mode)
				("C-' DEL" . hungry-delete-backward))
	:hook ((emacs-lisp-mode-hook lisp-mode-hook) . hungry-delete-mode))

;;; rainbow-delimiters
(package-require rainbow-delimiters
	:hook ((lisp-mode-hook emacs-lisp-mode-hook org-mode-hooke eshell-mode-hook) . rainbow-delimiters-mode))

;;; indent guide
(package-require indent-guide
	:hook (after-init-hook . indent-guide-global-mode))

;;; doom-modeline
(package-require doom-modeline
	:disable
	:hook (after-init-hook . doom-modeline-mode)
	:config (progn
						(setq-default doom-modeline-height 13)
						(setq-default doom-modeline-bar-width 3)))

;;; Window Resize
(package-require windresize
	:key (("C-' C-r" . windresize)
				(windresize-map . (("C-n" . windresize-down)
													 ("C-p" . windresize-up)
													 ("C-b" . windresize-left)
													 ("C-f" . windresize-right)))))

;;; youdao translate
(package-require youdao-dictionary
	:key ("C-' t" . youdao-dictionary-search-at-point))

;;; Treemacs : File explore
(package-require treemacs
	:key ("C-' e" . treemacs)
	:hook (treemacs-select-hook . (lambda () (evil-change-state 'emacs))))

;;; Caps_Lock
(package-require caps-lock
	:key ("C-' g" . caps-lock-mode))

;;; GitHub Explorer
(package-require github-explorer
	:key ("C-' G" . github-explorer)
	:hook (github-explorer-mode-hook . (lambda () (evil-change-state 'emacs))))

;;; Input Method
(package-require pyim-basedict)
(package-require pyim
	:config (progn
						(pyim-basedict-enable)
						(pyim-isearch-mode t))
	:var ((default-input-method . "pyim")
				(pyim-default-scheme . 'quanpin)
				(pyim-page-tooltip . 'posframe)
				(pyim-page-length  . 8)
				(pyim-page-style . 'one-line)
				(pyim-punctuation-translate . '(auto yes no)))
	:key ("M-j" . pyim-convert-string-at-point))

;;; Arch Package Manager
(package-require arch-packer)

;;; Command Shower
(package-require command-log-mode
	:config (defun spring/open-or-close-command-log-mode ()
						"Open the command-log-mode."
						(interactive)
						(global-command-log-mode)
						(clm/toggle-command-log-buffer))
	:key (("C-' k" . spring/open-or-close-command-log-mode)
				("C-' K" . clm/command-log-clear)))

;;; Ranger
(package-require ranger
	:key (ranger-mode-map . (("n" . ranger-up-directory)
													 ("k" . ranger-search-next)
													 ("i" . ranger-find-file)
													 ("uv" . nil)
													 ("um" . nil)
													 ("uv" . nil)
													 ("u" . ranger-prev-file)
													 ("e" . ranger-next-file)))
	:config (ranger-override-dired-mode t))

(provide 'init-tools)
