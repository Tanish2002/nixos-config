(setq doom-font (font-spec :family "Iosevka Term" :size 13)
      doom-big-font (font-spec :family "Iosevka Term" :size 20)
      doom-variable-pitch-font (font-spec :family "Iosevka Term" :size 13))
(setq doom-theme 'doom-laserwave)

(add-hook! 'emacs-startup-hook #'doom-init-ui-h)
(setq +treemacs-git-mode 'deferred)
