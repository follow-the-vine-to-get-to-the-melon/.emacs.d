;;;; This is the lsp-mode settings file

;;; Packages
;;; Lsp-mode
(package-require lsp-mode
	:hook ((c-mode-hook c++-mode-hook lisp-mode-hook js-mode-hook web-mode-hook) . lsp)
	:key ("C-' F" . lsp-format-buffer)
	:config (progn
						(setq lsp-idle-delay 1200
									lsp-auto-guess-root nil
									lsp-file-watch-threshold 2000
									lsp-eldoc-hook nil
									lsp-log-io nil
									lsp-enable-folding nil	 
									lsp-enable-snippet nil	 
									lsp-prefer-flymake :none)))
;;; lsp-ui
(package-require lsp-ui
	:hook (lsp-mode-hook . lsp-ui-mode)
	:var ((lsp-ui-sideline-enable . t)
				(lsp-ui-sideline-delay . 5)
				(lsp-ui-peek-enable . t)
				(lsp-ui-doc-enable . t))
	:config (progn
						(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
						(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)))

;;;FlyMake
(package-require flymake
	:key ("C-' C-f" . flymake-mode))

(defvar lsp-on-touch-time 0
	"The lsp-on-change's time.")

;;; Dap-mode
(package-require dap-mode
	:key ("C-' d" . dap-debug))

;;; Config
(eval-after-load 'lsp-mode
	'(progn
		 (defvar lsp-on-touch-time 0)
     (defadvice lsp-on-change (around lsp-on-change-hack activate)
       ;; don't run `lsp-on-change' too frequently
       (when (> (- (float-time (current-time))
									 lsp-on-touch-time) 30)
				 (setq lsp-on-touch-time (float-time (current-time)))
				 ad-do-it))))

(provide 'init-lsp)
