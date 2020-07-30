;;;; This file is used for the keybindings
(define-prefix-command 'ctl-z-map)		 ; Create the C-z map
(global-set-key (kbd "C-z") 'ctl-z-map)		 ; Set the C-z
(global-set-key (kbd "C-z i") 'open-config-file) ; Open the init.el
(global-set-key (kbd "C-z p") 'package-list-packages) ; Open the package interface
(global-set-key (kbd "C-z d") 'auto-download-plugins) ; Auto download plugins
(global-set-key (kbd "C-z C-b") 'buffer-menu) ; Open the buffer menu
(global-set-key (kbd "C-z C-i") 'erc) ;Open the erc
(global-set-key (kbd "C-z C-w") 'eaf-open-browser) ; Open the eaf browser
(global-set-key (kbd "C-z C-m") 'eaf-open-bookmark) ; Open the eaf browser by bookmarks
(global-set-key (kbd "C-z C-t") 'open-vterm) ; Open vterm
(global-set-key (kbd "C-z C-p") 'previous-buffer) ; Goto previous buffer
(global-set-key (kbd "C-z C-n") 'next-buffer)	  ;Goto Next buffer
(global-set-key (kbd "C-z m") 'set-mark-command) ; The mark key map
(global-set-key (kbd "<f12>") 'tab-bar-mode) ; Open or close the tab-bar-mode
(global-set-key (kbd "C-z c") 'open-etc-config) ; Open the etc config dir

(provide 'init-keymaps)
