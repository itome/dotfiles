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
     javascript
     react
     html
     octave
     ruby
     shell-scripts
     vimscript
     python
     (python :variables
             python-enable-yapf-format-on-save nil)
     common-lisp
     emacs-lisp
     plantuml

     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip 'manual)
     better-defaults
     git
     markdown
     org
     (shell :variables
            shell-default-term-shell "/usr/bin/fish"
            shell-default-shell 'term
            shell-default-full-span nil
            shell-default-height 45
            shell-default-position 'bottom)
     syntax-checking
     (spell-checking :variables
                     enable-flyspell-auto-completion t)
     (version-control :variables
                      version-control-diff-tool 'git-gutter+
                      version-control-global-margin t
                      version-control-diff-side 'left)

     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      atom-one-dark-theme
                                      all-the-icons
                                      auto-save-buffers-enhanced
                                      rainbow-mode
                                      mozc
                                      quickrun
                                      all-the-icons-dired
                                      solaire-mode
                                      doom-themes
                                      hlinum
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
   dotspacemacs-check-for-update nil
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
   dotspacemacs-default-font '("Source Code Pro for Powerline"
                               :size 21
                               :weight regular
                               :width regular
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
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
   dotspacemacs-helm-no-header t
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
   dotspacemacs-loading-progress-bar nil
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
   dotspacemacs-inactive-transparency 90
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
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


  ;;
  ;; emacs setting
  ;;

  ;; title bar
  (setq frame-title-format "spacemacs")

  (setq-default cursor-in-non-selected-windows nil)

  ;; line spacing
  (setq-default line-spacing 4)

  ;; not fold in right edge
  (setq-default truncate-lines t
                truncate-partial-width-windows t)

  (spacemacs/toggle-vi-tilde-fringe-off)

  (global-auto-revert-mode t)

  ;; don't create backup files
  (setq make-backup-files nil
        create-lockfiles nil
        auto-save-default nil)

  ;; backspace like intellij idea
  (defun smart-backspace ()
    (interactive)
    (let* ((current (save-excursion
                      (point)))
           (beginning (save-excursion
                        (beginning-of-line)
                        (point))))
      (if (string-match "^[ \t]*$" (buffer-substring beginning current))
          (progn
            (kill-line 0)
            (delete-backward-char 1)
            (indent-for-tab-command))
        (delete-backward-char 1))))
  (define-key evil-insert-state-map [?\C-?] 'smart-backspace)
  (define-key key-translation-map [?\C-h] [?\C-?])

  ;;
  ;; package setting
  ;;

  ;; load theme
  (load-theme 'atom-one-dark t)
  ;; brighten buffers (that represent real files)
  (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
  (add-hook 'ediff-prepare-buffer-hook #'solaire-mode)
  (add-hook 'after-revert-hook #'turn-on-solaire-mode)
  (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

  ;; mode-line setting
  (spaceline-toggle-minor-modes-off)
  (setq powerline-default-separator 'slant)

  ;; pop shell by C-'
  (global-set-key (kbd "C-'") 'spacemacs/default-pop-shell)

  ;; subtle diff indicators in the fringe
  (setq-default fringes-outside-margins t)
  (hlinum-activate)
  (setq linum-format " %4d  ")
  ;; see also custom face variables
  (setq git-gutter+-added-sign " ")
  (setq git-gutter+-modified-sign " ")
  (setq git-gutter+-deleted-sign " ")

  ;; auto-save
  (require 'auto-save-buffers-enhanced)
  (setq auto-save-buffers-enhanced-interval  0.5)
  (setq auto-save-buffers-enhanced-include-regexps '(".+"))
  (setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))
  (setq auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
  (setq auto-save-buffers-enhanced-quiet-save-p t)
  (setq auto-save-buffers-enhanced-file-related-with-scratch-buffer
        (locate-user-emacs-file "scratch"))
  (auto-save-buffers-enhanced t)

  ;; neotree setting
  (setq neo-banner-message nil
        neo-show-updir-line nil
        neo-auto-indent-point nil
        neo-mode-line-type 'none
        neo-smart-open t
        neo-vc-integration '(face char))
  (doom-themes-neotree-config)
  (setq doom-neotree-file-icons t
        doom-neotree-line-spacing 4)

  ;; plantuml setting
  (setq plantuml-jar-path "/home/takeshi/ProgramFiles/plantuml.jar"
        plantuml-output-type "png")

  ;; face color for company quick help
  (setq company-quickhelp-color-background "#3E4451"
        company-quickhelp-color-foreground "#ABB2BF")

  ;; rainbow-mode setting
  (require 'rainbow-mode)
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'less-css-mode-hook 'rainbow-mode)
  (add-hook 'web-mode-hook 'rainbow-mode)
  (add-hook 'react-mode-hook 'rainbow-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)

  ;; quickrun setting
  (require 'quickrun)
  (define-key evil-normal-state-map (kbd "SPC R r") 'quickrun)
  (define-key evil-normal-state-map (kbd "SPC R a") 'quickrun-with-arg)
  (define-key evil-normal-state-map (kbd "SPC R c") 'quickrun-compile-only)

  ;; enable emacs-mozc
  (require 'mozc)
  (setq default-input-method "japanese-mozc")
  (setq quail-japanese-use-double-n t)
  (setq mozc-candidate-style 'overlay)
  (global-set-key (kbd "C-SPC") 'toggle-input-method)

  ;; spell checking setting
  (setq-default ispell-program-name "aspell")

  ;; all-the-icons
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

  ;;
  ;; language settings
  ;;

  ;; javascript
  (setq-default
   ;; js2-mod
   js2-basic-offset 2
   js-indent-level 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
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
    (spaceline-all-the-icons solaire-mode org-category-capture company-quickhelp hlinum doom-themes all-the-icons-dired flyspell-popup quickrun mozc rainbow-mode powerline spinner hydra parent-mode projectile pkg-info epl flx smartparens iedit anzu evil goto-chg undo-tree highlight diminish bind-map bind-key packed f dash s helm avy helm-core popup rjsx-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data plantuml-mode lispxmp auto-save-buffers-enhanced rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby insert-shebang fish-mode company-shell all-the-icons memoize font-lock+ vimrc-mode dactyl-mode yapfify xterm-color web-beautify unfill slime-company slime shell-pop pyvenv pytest pyenv-mode py-isort pip-requirements mwim multi-term mmm-mode markdown-toc markdown-mode livid-mode skewer-mode simple-httpd live-py-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode helm-pydoc git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md eshell-z eshell-prompt-extras esh-help diff-hl cython-mode company-tern dash-functional tern company-anaconda common-lisp-snippets coffee-mode anaconda-mode pythonic smeargle orgit org-projectile org-present org-pomodoro alert log4e gntp org-download magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor async company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete atom-one-dark-theme ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#21242B"))))
 '(fringe ((t (:inherit default))))
 '(company-preview-common ((t (:foreground "lightgray" :background nil :underline t))))
 '(company-scrollbar-bg ((t (:background "gray40"))))
 '(company-scrollbar-fg ((t (:background "white"))))
 '(company-tooltip ((t (:foreground "#ABB2BF" :background "#3E4451"))))
 '(company-tooltip-annotation ((t (:foreground "#ABB2BF" :background "#3E4451"))))
 '(company-tooltip-annotation-selection ((t (:foreground "white" :background "steelblue"))))
 '(company-tooltip-common ((t (:foreground "#ABB2BF" :background "#3E4451"))))
 '(company-tooltip-common-selection ((t (:foreground "white" :background "steelblue"))))
 '(company-tooltip-selection ((t (:foreground "black" :background "steelblue"))))
 '(doom-neotree-dir-face ((t (:foreground "#61AFEF"))))
 '(flycheck-error ((t (:foreground "red" :background nil))))
 '(flycheck-info ((t (:foreground "skyblue" :background nil))))
 '(flycheck-warning ((t (:foreground "yellow" :background nil))))
 '(git-gutter+-added ((t (:foreground "#98C379" :background "#98C379"))))
 '(git-gutter+-deleted ((t (:foreground "#E06C75" :background "#E06C75"))))
 '(git-gutter+-modified ((t (:foreground "#D19A66" :background "#D19A66"))))
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
