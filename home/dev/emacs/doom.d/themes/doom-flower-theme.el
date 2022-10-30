;;; doom-flower-theme.el --- Custom Theme
;;; -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;;; This theme is custom

(require 'doom-themes)

;;; Code:
(defgroup doom-flower-theme nil
  "Options for the `doom-flower' theme."
  :group 'doom-themes)

(defcustom doom-flower-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-flower-theme
  :type 'boolean)

(defcustom doom-flower-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-flower-theme
  :type 'boolean)

(defcustom doom-flower-comment-bg doom-flower-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their legibility."
  :group 'doom-flower-theme
  :type 'boolean)

(defcustom doom-flower-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'doom-flower-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-flower
  "A port of the port of the Visual Studio Code theme flower"

  ;; name       default    256       16
  ((bg         '("#0f0f12" nil       nil            ))
   (bg-alt     '("#121212" nil       nil            ))
   (base0      '("#181818" "black"   "black"        ))
   (base1      '("#0c0c0c" "#111111" "brightblack"  ))
   (base2      '("#1a1a1a" "#333333" "brightblack"  ))
   (base3      '("#232530" "#555555" "white"        ))
   (base4      '("#958788" "#6a6a6a" "white"        ))
   (base5      '("#f9cec3" "#f9cec3" "white"        ))
   (base6      '("#f9cbbe" "#f9cbbe" "white"        ))
   (base7      '("#fadad1" "#fadad1" "white"        ))
   (base8      '("#f8e1e2" "#f8e1e2" "white"        ))
   (fg-alt     '("#d6c2c3" "#d6c2c3" "brightwhite"  ))
   (fg         '("#d6c2c3" "#d6c2c3" "white"        ))

   (grey       base4)
   (red        '("#7b3b4a" "#7b3b4a" "red"          ))
   (orange     '("#ff6464" "#ff6464" "brightred"    ))
   (green      '("#3a655e" "#3A655e" "green"        ))
   (teal       '("#527670" "#527670" "brightgreen"  ))
   (yellow     '("#8d9d4a" "#8d9d4a" "yellow"       ))
   (blue       '("#6063a9" "#6063a9" "brightblue"   ))
   (dark-blue  '("#494da1" "#494da1" "blue"         ))
   (magenta    '("#9b4fbf" "#9b4fbf" "magenta"      ))
   (violet     '("#a265bf" "#a265bf" "brightmagenta"))
   (cyan       '("#5dd4d4" "#5dd4d4" "brightcyan"   ))
   (dark-cyan  '("#39d4d4" "#39d4d4" "cyan"   ))

   ;; additional highlighting colours for flower
   (hor-highlight  `(,(doom-lighten (car base3) 0.05) ,@(cdr base2)))
   (hor-highlight-selected (doom-lighten base3 0.1))
   (hor-highlight-bright (doom-lighten base3 0.2))
   (hor-highlight-brighter (doom-lighten base3 0.5))

   ;; face categories -- required for all themes
   (highlight      red)
   (vertical-bar   base0)
   (selection      violet)
   (builtin        violet)
   (comments       (if doom-flower-brighter-comments magenta hor-highlight-bright))
   (doc-comments   yellow)
   (constants      orange)
   (functions      teal)
   (keywords       violet)
   (methods        magenta)
   (operators      teal)
   (type           teal)
   (strings        yellow)
   (variables      red)
   (numbers        orange)
   (region         hor-highlight)
   (error          red)
   (warning        dark-cyan)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)


   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-flower-brighter-modeline)
   (-modeline-pad
    (when doom-flower-padded-modeline
      (if (integerp doom-flower-padded-modeline) doom-flower-padded-modeline 4)))

   (modeline-fg     `(,(doom-darken (car fg) 0.2) ,@(cdr fg-alt)))
   (modeline-fg-alt `(,(doom-lighten (car bg) 0.2) ,@(cdr base3)))

   (modeline-bg (if -modeline-bright base4 base1))
   (modeline-bg-inactive base1))


  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :slant 'italic
    :background (if doom-flower-comment-bg (doom-lighten bg 0.03)))
   (fringe :background bg)
   (link :foreground yellow :inherit 'underline)
   ((line-number &override) :foreground hor-highlight-selected)
   ((line-number-current-line &override) :foreground hor-highlight-brighter)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))
   (mode-line-highlight :background base1 :foreground fg)
   (tooltip :background base0 :foreground fg)

   ;;;; company
   (company-box-background    :background base0 :foreground fg)
   (company-tooltip-common    :foreground red :weight 'bold)
   (company-tooltip-selection :background hor-highlight :foreground fg)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground violet)
   (css-property             :foreground fg)
   (css-selector             :foreground red)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-highlight :foreground (doom-lighten bg 0.3))
   (doom-modeline-project-dir :foreground red :inherit 'bold )
   (doom-modeline-buffer-path :foreground red)
   (doom-modeline-buffer-file :foreground fg)
   (doom-modeline-buffer-modified :foreground violet)
   (doom-modeline-panel :background base1)
   (doom-modeline-urgent :foreground modeline-fg)
   (doom-modeline-info :foreground cyan)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; evil
   (evil-ex-search          :background hor-highlight-selected :foreground fg)
   (evil-ex-lazy-highlight  :background hor-highlight :foreground fg)
   ;;;; haskell-mode
   (haskell-type-face :foreground violet)
   (haskell-constructor-face :foreground yellow)
   (haskell-operator-face :foreground fg)
   (haskell-literate-comment-face :foreground hor-highlight-selected)
   ;;;; ivy
   (ivy-current-match       :background hor-highlight :distant-foreground nil)
   (ivy-posframe-cursor     :background red :foreground base0)
   (ivy-minibuffer-match-face-2 :foreground red :weight 'bold)
   ;;;; js2-mode
   (js2-object-property        :foreground red)
   ;;;; markdown-mode
   (markdown-markup-face           :foreground cyan)
   (markdown-link-face             :foreground orange)
   (markdown-link-title-face       :foreground yellow)
   (markdown-header-face           :foreground red :inherit 'bold)
   (markdown-header-delimiter-face :foreground red :inherit 'bold)
   (markdown-language-keyword-face :foreground orange)
   (markdown-markup-face           :foreground fg)
   (markdown-bold-face             :foreground violet)
   (markdown-table-face            :foreground fg :background base1)
   ((markdown-code-face &override) :foreground orange :background base1)
   ;;;; orderless
   (orderless-match-face-1 :weight 'bold :foreground (doom-blend red fg 0.6) :background (doom-blend red bg 0.1))
   ;;;; mic-paren
   (paren-face-match    :foreground green   :background base0 :weight 'ultra-bold)
   (paren-face-mismatch :foreground yellow :background base0   :weight 'ultra-bold)
   (paren-face-no-match :inherit 'paren-face-mismatch :weight 'ultra-bold)
   ;;;; magit
   (magit-section-heading :foreground red)
   (magit-branch-remote   :foreground orange)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground blue :background nil)
   ;;;; org <built-in>
   ((org-block &override) :background base1)
   ((org-block-begin-line &override) :background base1 :foreground comments)
   (org-hide :foreground hidden)
   (org-link :inherit 'underline :foreground yellow)
   (org-agenda-done :foreground cyan)
   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-tag-bracket-face :foreground red)
   (rjsx-attr :foreground cyan :slant 'italic :weight 'medium)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   ;;;; treemacs
   (treemacs-root-face :foreground fg :weight 'bold :height 1.2)
   (doom-themes-treemacs-root-face :foreground fg :weight 'ultra-bold :height 1.2)
   (doom-themes-treemacs-file-face :foreground fg)
   (treemacs-directory-face :foreground fg)
   (treemacs-git-modified-face :foreground green)
   ;;;; web-mode
   (web-mode-html-tag-bracket-face :foreground red)
   (web-mode-html-tag-face         :foreground red)
   (web-mode-html-attr-name-face   :foreground orange)))

;;; doom-flower-theme.el ends here
