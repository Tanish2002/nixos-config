(setq doom-font (font-spec :family "Iosevka Nerd Font Mono" :size 13)
      doom-big-font (font-spec :family "Iosevka Nerd Font Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font Mono" :size 13))
(setq doom-theme 'doom-horizon)

(add-hook! 'emacs-startup-hook #'doom-init-ui-h)
(setq +treemacs-git-mode 'deferred)
;; accept completion from copilot and fallback to company
(defun set-flutter-sdk-dir ()
  (direnv-update-environment)
  (setq lsp-dart-flutter-sdk-dir
        (string-trim-right (shell-command-to-string "echo $FLUTTER_SDK"))))

(use-package dart-mode
  :init
  (add-hook 'dart-mode-hook 'set-flutter-sdk-dir))
(provide 'config)
;;; config.el ends here
