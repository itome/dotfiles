;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     yaml
     (c-c++ :variable
            c-c++-enable-clang-support t
            c-c++-default-mode-for-headers 'c++-mode)
     cscope
     javascript
     java
     react
     typescript
     html
     octave
     ruby
     shell-scripts
     vimscript
     (python :variables
             python-enable-yapf-format-on-save nil)
     common-lisp
     emacs-lisp
     plantuml
     csv
     semantic

     helm
     org
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip 'manual
                      :disabled-for markdown git)
     better-defaults
     git
     markdown
     (syntax-checking :variables
                      syntax-checking-enable-tooltips nil)
     (version-control :variables
                      version-control-diff-side 'left
                      version-control-diff-tool 'git-gutter+)
     colors
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      atom-one-dark-theme
                                      doom-themes
                                      solaire-mode
                                      all-the-icons
                                      all-the-icons-dired
                                      spaceline-all-the-icons
                                      hlinum
                                      quickrun
                                      smart-backspace
                                      flycheck-package
                                      migemo
                                      editorconfig
                                      lispxmp
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(farmhouse-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 12
                               :weight regular
                               :width regular)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'nil
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching

   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 100
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")

   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))

  ;; Japanese font
  (set-fontset-font t 'japanese-jisx0208 (font-spec :family "Source Han Sans"))

  ;; title bar
  (setq frame-title-format "%b")

  ;; line spacing
  (setq-default line-spacing 4)

  (setq-default cursor-in-non-selected-windows nil)

  ;; not fold in right edge
  (setq-default truncate-lines t
                truncate-partial-width-windows t)

  ;; font ligature
  (if (fboundp 'mac-auto-operator-composition-mode)
      (mac-auto-operator-composition-mode))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


  ;;
  ;; emacs settings
  ;;

  (add-to-list 'load-path "~/dotfiles/.spacemacs.d/local/")

  ;; don't create backup files
  (setq make-backup-files nil
        ns-use-srgb-colorspace nil
        create-lockfiles nil
        auto-save-default nil)

  ;;
  ;; layer settings
  ;;

  ;; diable tilde
  (spacemacs/toggle-vi-tilde-fringe-off)

  ;; version-controll layer
  (setq-default fringes-outside-margins t)
  (fringe-mode '(8 . 0))
  (use-package git-gutter-fringe+
    :commands git-gutter+-mode
    :config
    (progn
      ;; custom graphics that works nice with half-width fringes
      (fringe-helper-define 'git-gutter-fr+-added '(center repeated)
        "XX......"
        )
      (fringe-helper-define 'git-gutter-fr+-modified '(center repeated)
        "XX......"
        )
      (fringe-helper-define 'git-gutter-fr+-deleted '(center repeated)
        "XX......"
        )))

  ;; company mode
  (setq company-quickhelp-color-background "#3E4451"
        company-quickhelp-color-foreground "#ABB2BF"
        company-idle-delay 0
        company-minimum-prefix-length 2
        company-tooltip-margin 2)

  ;;
  ;; additional package settings
  ;;

  ;; load theme
  (use-package atom-one-dark-theme
    :init
    (load-theme 'atom-one-dark t))
  (use-package doom-themes
    :init
    (setq neo-banner-message nil
          neo-show-updir-line nil
          neo-auto-indent-point nil
          neo-vc-integration t
          neo-smart-open t
          neo-mode-line-type 'none)
    :config
    (doom-themes-neotree-config)
    (setq doom-neotree-file-icons t
          doom-neotree-line-spacing 4))
  (use-package solaire-mode
    :init
    (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
    (add-hook 'ediff-prepare-buffer-hook #'solaire-mode)
    (add-hook 'after-revert-hook #'turn-on-solaire-mode)
    (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer))

  (use-package spaceline-all-the-icons
    :after spaceline
    :config
    (spaceline-all-the-icons-theme)
    (setq spaceline-all-the-icons-icon-set-modified 'circle)
    (setq spaceline-all-the-icons-icon-set-git-ahead 'commit)
    (setq spaceline-all-the-icons-highlight-file-name t)
    (setq spaceline-responsive nil)
    (setq spaceline-all-the-icons-icon-set-flycheck-slim 'outline)
    (setq spaceline-all-the-icons-separator-type 'arrow)
    (spaceline-toggle-all-the-icons-eyebrowse-workspace-off)
    (spaceline-toggle-all-the-icons-minor-modes-off)
    (spaceline-toggle-all-the-icons-projectile-off)
    (spaceline-toggle-all-the-icons-dedicated-off)
    (spaceline-toggle-all-the-icons-vc-icon-off)
    (spaceline-toggle-all-the-icons-window-number-off))

  ;; line-number setting
  (use-package hlinum
    :config
    (hlinum-activate)
    (setq linum-format " %4d  "))

  ;; quickrun setting
  (use-package quickrun
    :config
    (spacemacs/declare-prefix "R" "quickrun")
    (define-key evil-normal-state-map (kbd "SPC R r") 'quickrun)
    (define-key evil-normal-state-map (kbd "SPC R a") 'quickrun-with-arg)
    (define-key evil-normal-state-map (kbd "SPC R e") 'quickrun-shell)
    (define-key evil-normal-state-map (kbd "SPC R c") 'quickrun-compile-only))

  (use-package auto-save-buffers-enhanced
    :config
    (setq auto-save-buffers-enhanced-interval 0.4
          auto-save-buffers-enhanced-include-regexps '(".+")
          auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$")
          auto-save-buffers-enhanced-quiet-save-p t)
    (auto-save-buffers-enhanced t))

  ;; all-the-icons
  (use-package all-the-icons-dired
    :init (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

  (use-package migemo
    :config
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
    (setq migemo-command "cmigemo")
    (setq migemo-options '("-q" "--emacs"))
    (setq migemo-user-dictionary nil)
    (setq migemo-coding-system 'utf-8)
    (setq migemo-regex-dictionary nil)
    (migemo-init)
    (with-eval-after-load "helm"
      (helm-migemo-mode t)))

  ;; flycheck emacs package
  (eval-after-load 'flycheck
    '(flycheck-package-setup))

  ;; smart backspace setting
  (use-package smart-backspace
    :config
    (define-key evil-insert-state-map [?\C-?] 'smart-backspace)
    (define-key key-translation-map [?\C-h] [?\C-?]))

  ;; helm setting
  (setq helm-split-window-inside-p t)

  ;; editor config
  (use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1))
  (add-to-list 'editorconfig-indentation-alist
               '(jsx-mode js2-basic-offset)
               '(rjsx-mode js2-basic-offset))

  ;; junk file
  (setq open-junk-file-format "~/Projects/junk/%Y/%m/%Y-%m-%d-%H%M%S.")

  ;;
  ;; language settings
  ;;

  ;; emacs-lisp
  (use-package lispxmp
    :config
    (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode
      "eb" 'lispxmp))

  ;; javascript
  (eval-after-load 'flycheck
    '(custom-set-variables
      '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))))
  (setq-default
   ;; js2-mod
   js2-basic-offset 2
   js-indent-level 2
   js-switch-indent-offset 2
   js2-include-browser-externs nil
   js2-mode-show-parse-errors nil
   js2-mode-show-strict-warnings nil
   js2-highlight-external-variables nil
   js2-include-jslint-globals nil
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode
    "gb" 'tern-pop-find-definition)
  (spacemacs/set-leader-keys-for-major-mode 'rjsx-mode
    "gb" 'tern-pop-find-definition)

  ;; typescript
  (setq typescript-indent-level 2)
  (spacemacs/set-leader-keys-for-major-mode 'typescript-mode
    "gg" 'tide-jump-to-definition)

  ;; plantuml setting
  (setq plantuml-jar-path "/home/takeshi/ProgramFiles/plantuml.jar"
        plantuml-output-type "png")

  ;; c-c++
  (setq semanticdb-find-default-throttle '(file))
  (add-hook 'c-mode-hook
            (lambda ()
              (clang-format-bindings)))
  (add-hook 'c++-mode-hook
            (lambda ()
              (clang-format-bindings)))
  (defun clang-format-bindings ()
    (define-key evil-normal-state-map (kbd "SPC m =") 'clang-format-buffer)
    (define-key evil-normal-state-map (kbd ", =") 'clang-format-buffer))

  ;; markdown
  (add-hook 'markdown-mode-hook 'spacemacs/toggle-truncate-lines-off)

  ;; java
  (setq eclim-eclipse-dirs '("/Applications/Eclipse.app")
        eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/plugins/org.eclim_2.7.2/bin/eclim"
        eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/plugins/org.eclim_2.7.2/bin/eclimd")

  ;; custom face
  (custom-set-faces
   '(default ((t (:background "#21242B"))))
   '(company-preview-common ((t (:foreground "lightgray" :background nil :underline t))))
   '(company-scrollbar-bg ((t (:background "#2E3441"))))
   '(company-scrollbar-fg ((t (:background "#3E4451"))))
   '(company-tooltip ((t (:foreground "#ABB2BF" :background "#2E3441"))))
   '(company-tooltip-annotation ((t (:foreground "#61AFEF" :background "#2E3441"))))
   '(company-tooltip-annotation-selection ((t (:foreground "#61AFEF" :background "#3E4451"))))
   '(company-tooltip-common ((t (:foreground "#ABB2BF" :background "#2E3441"))))
   '(company-tooltip-common-selection ((t (:foreground "white" :background "#3E4451"))))
   '(company-tooltip-selection ((t (:foreground "#ABB2BF" :background "#3E4451"))))
   '(doom-neotree-dir-face ((t (:foreground "#61AFEF"))))
   '(flycheck-error ((t (:foreground "red" :background nil))))
   '(flycheck-info ((t (:foreground "skyblue" :background nil))))
   '(flycheck-pos-tip ((t (:foreground "#ABB2BF" :background "#2E3441"))))
   '(flycheck-warning ((t (:foreground "yellow" :background nil))))
   '(fringe ((t (:inherit default))))
   '(git-gutter+-added ((t (:foreground "#009933"))))
   '(git-gutter+-modified ((t (:foreground "#cc00ff"))))
   '(git-gutter+-deleted ((t (:foreground "#cc0066"))))
   '(header-line ((t (:background "#21242B"))))
   '(linum ((t (:foreground "#3E4451"))))
   '(linum-highlight-face ((t (:foreground "#666D7A"))))
   '(mode-line ((t (:foreground nil :background "#282C34"))))
   '(mode-line-inactive ((t (:foreground nil :background "#282C34"))))
   '(neo-root-dir-face ((t (:foreground nil))))
   '(neo-vc-added-face ((t (:foreground "#98C379"))))
   '(neo-vc-edited-face ((t (:foreground "#D19A66"))))
   '(powerline-active1 ((t (:foreground nil :background "#495259"))))
   '(powerline-inactive1 ((t (:foreground "#AAAAAA" :background "#121417"))))
   '(powerline-inactive2 ((t (:foreground nil :background "#495259"))))
   '(solaire-default-face ((t (:inherit default :background "#282C34"))))
   '(vertical-border ((t (:foreground "#21242B")))))
  )


(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(ansi-color-names-vector
     ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
   '(evil-want-Y-yank-to-eol nil)
   '(package-selected-packages
     (quote
      (symon string-inflection ruby-refactor realgud test-simple loc-changes load-relative password-generator impatient-mode helm-purpose window-purpose imenu-list flycheck-bashate farmhouse-theme evil-lion editorconfig cmake-ide levenshtein browse-at-remote prettier-js eslintd-fix yaml-mode tide typescript-mode csv-mode stickyfunc-enhance srefactor disaster company-c-headers cmake-mode clang-format spaceline-all-the-icons solaire-mode org-category-capture company-quickhelp hlinum doom-themes all-the-icons-dired flyspell-popup quickrun mozc rainbow-mode powerline spinner hydra parent-mode projectile pkg-info epl flx smartparens iedit anzu evil goto-chg undo-tree highlight diminish bind-map bind-key packed f dash s helm avy helm-core popup rjsx-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data plantuml-mode lispxmp auto-save-buffers-enhanced rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby insert-shebang fish-mode company-shell all-the-icons memoize font-lock+ vimrc-mode dactyl-mode yapfify xterm-color web-beautify unfill slime-company slime shell-pop pyvenv pytest pyenv-mode py-isort pip-requirements mwim multi-term mmm-mode markdown-toc markdown-mode livid-mode skewer-mode simple-httpd live-py-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode helm-pydoc git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md eshell-z eshell-prompt-extras esh-help diff-hl cython-mode company-tern dash-functional tern company-anaconda common-lisp-snippets coffee-mode anaconda-mode pythonic smeargle orgit org-projectile org-present org-pomodoro alert log4e gntp org-download magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor async company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete atom-one-dark-theme ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(flycheck-disabled-checkers (quote (javascript-jshint javascript-jscs)))
 '(package-selected-packages
   (quote
    (spaceline-all-the-icons add-node-modules-path helm-cscope xcscope flycheck-ycmd company-ycmd ycmd request-deferred deferred lispxmp real-auto-save company-emacs-eclim eclim editorconfig company-dart dart-mode typescript-mode powerline slime pcre2el spinner org-category-capture alert log4e gntp org-plus-contrib markdown-mode macrostep skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode hydra parent-mode projectile request haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter package-lint flycheck pkg-info epl flx magit magit-popup git-commit ghub let-alist with-editor smartparens iedit anzu evil goto-chg undo-tree highlight web-completion-data dash-functional tern pos-tip company inf-ruby bind-map bind-key yasnippet packed anaconda-mode pythonic f dash s all-the-icons memoize helm avy helm-core async auto-complete popup org-mime zoom yapfify yaml-mode ws-butler winum which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill toc-org tide tagedit stickyfunc-enhance srefactor spaceline solaire-mode smeargle smart-backspace slime-company slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rjsx-mode restart-emacs rbenv rake rainbow-mode rainbow-identifiers rainbow-delimiters quickrun pyvenv pytest pyenv-mode py-isort pug-mode popwin plantuml-mode pip-requirements persp-mode paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree mwim move-text mmm-mode minitest migemo markdown-toc magit-gitflow lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc insert-shebang info+ indent-guide hy-mode hungry-delete htmlize hlinum hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flycheck-pos-tip flycheck-package flx-ido fish-mode fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu emmet-mode elisp-slime-nav dumb-jump doom-themes disaster diminish diff-hl define-word dactyl-mode cython-mode csv-mode company-web company-tern company-statistics company-shell company-quickhelp company-c-headers company-anaconda common-lisp-snippets column-enforce-mode color-identifiers-mode coffee-mode cmake-mode clean-aindent-mode clang-format chruby bundler auto-yasnippet auto-save-buffers-enhanced auto-highlight-symbol auto-compile atom-one-dark-theme all-the-icons-dired aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview-common ((t (:foreground "lightgray" :background nil :underline t))))
 '(company-scrollbar-bg ((t (:background "#2E3441"))))
 '(company-scrollbar-fg ((t (:background "#3E4451"))))
 '(company-tooltip ((t (:foreground "#ABB2BF" :background "#2E3441"))))
 '(company-tooltip-annotation ((t (:foreground "#61AFEF" :background "#2E3441"))))
 '(company-tooltip-annotation-selection ((t (:foreground "#61AFEF" :background "#3E4451"))))
 '(company-tooltip-common ((t (:foreground "#ABB2BF" :background "#2E3441"))))
 '(company-tooltip-common-selection ((t (:foreground "white" :background "#3E4451"))))
 '(company-tooltip-selection ((t (:foreground "#ABB2BF" :background "#3E4451"))))
 '(doom-neotree-dir-face ((t (:foreground "#61AFEF"))))
 '(flycheck-error ((t (:foreground "red" :background nil))))
 '(flycheck-info ((t (:foreground "skyblue" :background nil))))
 '(flycheck-pos-tip ((t (:foreground "#ABB2BF" :background "#2E3441"))))
 '(flycheck-warning ((t (:foreground "yellow" :background nil))))
 '(fringe ((t (:inherit default))))
 '(git-gutter+-added ((t (:foreground "#009933"))))
 '(git-gutter+-deleted ((t (:foreground "#cc0066"))))
 '(git-gutter+-modified ((t (:foreground "#cc00ff"))))
 '(header-line ((t (:background "#21242B"))))
 '(linum ((t (:foreground "#3E4451"))))
 '(linum-highlight-face ((t (:foreground "#666D7A"))))
 '(mode-line ((t (:foreground nil :background "#282C34"))))
 '(mode-line-inactive ((t (:foreground nil :background "#282C34"))))
 '(neo-root-dir-face ((t (:foreground nil))))
 '(neo-vc-added-face ((t (:foreground "#98C379"))))
 '(neo-vc-edited-face ((t (:foreground "#D19A66"))))
 '(powerline-active1 ((t (:foreground nil :background "#495259"))))
 '(powerline-inactive1 ((t (:foreground "#AAAAAA" :background "#121417"))))
 '(powerline-inactive2 ((t (:foreground nil :background "#495259"))))
 '(solaire-default-face ((t (:inherit default :background "#282C34"))))
 '(vertical-border ((t (:foreground "#21242B")))))
