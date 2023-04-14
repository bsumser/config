;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Brett Sumser"
      user-mail-address "bsumser@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox
doom-font (font-spec :family "Source Code Pro" :size 24 :weight 'normal))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory "~/org/")
(setq org-roam-db-location "~/org/org-roam.db")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org")
         "* TODO %?\n  %i\n  %a")
      ("r" "Project todo" entry (file+headline notes.org "Tasks")
        "* TODO %? :%(gkh/project-current-name):" :prepend t)))

;; Debug C++ code
(setq dap-auto-configure-mode t)
'(requires 'dap-cpptools)

;; Make new frames instead of new windows
;; http://techtrickery.com/tearing-out-the-emacs-window-manager.html
    (set 'pop-up-frames 'graphic-only)

;; kill frames when a buffer is buried, makes most things play nice with
;; frames
(set 'frame-auto-hide-function 'delete-frame)

(require 'ox-publish)
(setq org-publish-project-alist
      '(
                ("org-notes"
                 :base-directory "~/org/"
                 :base-extension "org"
                 :publishing-directory "~/webpage/public/pages/notes"
                 :recursive t
                 :publishing-function org-html-publish-to-html
                 :headline-levels 4             ; Just the default for this project.
                 :auto-preamble t
                 )
                ("org-static"
                 :base-directory "~/org/"
                 :base-extension "ss\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
                 :publishing-directory "~/webpage/public/pages/notes"
                 :recursive t
                 :publishing-function org-publish-attachment
                 )
                ("org" :components ("org-notes" "org-static"))
      ))

;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"styles.css\" />")

(custom-set-variables
'(shell-pop-set-internal-mode "ansi-term")
'(shell-pop-set-internal-mode-shell "/bin/bash")
'(shell-pop-set-window-height 60) ;the number for the percentage of the selected window. if 100, shell-pop use the whole of selected window, not spliting.
'(shell-pop-set-window-position "bottom") ;shell-pop-up position. You can choose "top" or "bottom".
'(global-set-key [f8] 'shell-pop))

(use-package! websocket
  :after org-roam-ui)

(use-package! simple-httpd
  :after org-roam-ui)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
