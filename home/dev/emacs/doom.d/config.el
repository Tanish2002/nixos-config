(setq doom-font (font-spec :family "Iosevka Term" :size 13)
      doom-big-font (font-spec :family "Iosevka Term" :size 20)
      doom-variable-pitch-font (font-spec :family "Iosevka Term" :size 13))
(setq doom-theme 'doom-horizon)

(add-hook! 'emacs-startup-hook #'doom-init-ui-h)
;; (setq +treemacs-git-mode 'deferred)
;; accept completion from copilot and fallback to company
(provide 'config)
;;; config.el ends here
