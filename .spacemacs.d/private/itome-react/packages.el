;;; packages.el --- react Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: itome <t.t.itm.0403@gmail.com>
;; URL: https://github.com/itome
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq itome-react-packages
      '(
        rjsx-mode
        company
        company-tern
        emmet-mode
        evil-matchit
        flycheck
        ggtags
        helm-gtags
        js-doc
        js2-refactor
        rjsx-mode
        tern
        web-beautify
        ))

(defun itome-react/init-rjsx-mode ()
  (use-package rjsx-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
      (add-to-list 'auto-mode-alist '("\\.react.js\\'" . rjsx-mode))
      (add-to-list 'auto-mode-alist '("\\index.android.js\\'" . rjsx-mode))
      (add-to-list 'auto-mode-alist '("\\index.ios.js\\'" . rjsx-mode))
      (add-to-list 'magic-mode-alist '("/\\*\\* @jsx React\\.DOM \\*/" . rjsx-mode))
      (add-to-list 'magic-mode-alist '("^import React" . rjsx-mode)))
    :config
    (progn
      ;; prefixes
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mh" "documentation")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mr" "refactor")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mg" "goto")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mz" "folding")
      ;; key bindings
      (evil-define-key 'insert rjsx-mode-map (kbd "C-d") 'spacemacs//rjsx-delete-creates-full-tag-with-insert)
      (evil-define-key 'normal rjsx-mode-map (kbd "C-d") 'spacemacs//rjsx-delete-creates-full-tag-with-insert)
      (spacemacs/set-leader-keys-for-major-mode 'rjsx-mode
        "w" 'js2-mode-toggle-warnings-and-errors
        "zc" 'js2-mode-hide-element
        "zo" 'js2-mode-show-element
        "zr" 'js2-mode-show-all
        "ze" 'js2-mode-toggle-element
        "zF" 'js2-mode-toggle-hide-functions
        "zC" 'js2-mode-toggle-hide-comments))))

(defun itome-react/post-init-company ()
  (spacemacs|add-company-hook rjsx-mode))

(defun itome-react/post-init-company-tern ()
  (push 'company-tern company-backends-rjsx-mode))

(defun itome-react/post-init-emmet-mode ()
  (add-hook 'rjsx-mode-hook 'emmet-mode)
  (add-hook 'rjsx-mode-hook 'spacemacs//setup-emmet-mode-for-react))

(defun itome-react/post-init-flycheck ()
  (dolist (mode '(rjsx-mode))
    (spacemacs/add-flycheck-hook mode)))

(defun itome-react/post-init-ggtags ()
  (add-hook 'rjsx-mode-hook #'spacemacs/ggtags-mode-enable))

(defun itome-react/post-init-helm-gtags ()
  (spacemacs/helm-gtags-define-keys-for-mode 'rjsx-mode))

(defun itome-react/post-init-js-doc ()
  (use-package js-doc
    :defer t
    :init (spacemacs/js-doc-set-key-bindings 'rjsx-mode)))

(defun itome-react/post-init-evil-matchit ()
  (add-hook `rjsx-mode `turn-on-evil-matchit-mode))

(defun itome-react/post-init-js2-refactor ()
  (add-hook 'rjsx-mode-hook 'spacemacs/js2-refactor-require)
  ;; prefixes
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mr3" "ternary")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mra" "add/args")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrb" "barf")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrc" "contract")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mre" "expand/extract")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mri" "inline/inject/introduct")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrl" "localize/log")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrr" "rename")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrs" "split/slurp")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrt" "toggle")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mru" "unwrap")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrv" "var")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrw" "wrap")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mx" "text")
  (spacemacs/declare-prefix-for-mode 'rjsx-mode "mxm" "move")
  ;; key bindings
  (spacemacs/set-leader-keys-for-major-mode 'rjsx-mode
    "r3i" 'js2r-ternary-to-if
    "rag" 'js2r-add-to-globals-annotation
    "rao" 'js2r-arguments-to-object
    "rba" 'js2r-forward-barf
    "rca" 'js2r-contract-array
    "rco" 'js2r-contract-object
    "rcu" 'js2r-contract-function
    "rea" 'js2r-expand-array
    "ref" 'js2r-extract-function
    "rem" 'js2r-extract-method
    "reo" 'js2r-expand-object
    "reu" 'js2r-expand-function
    "rev" 'js2r-extract-var
    "rig" 'js2r-inject-global-in-iife
    "rip" 'js2r-introduce-parameter
    "riv" 'js2r-inline-var
    "rlp" 'js2r-localize-parameter
    "rlt" 'js2r-log-this
    "rrv" 'js2r-rename-var
    "rsl" 'js2r-forward-slurp
    "rss" 'js2r-split-string
    "rsv" 'js2r-split-var-declaration
    "rtf" 'js2r-toggle-function-expression-and-declaration
    "ruw" 'js2r-unwrap
    "rvt" 'js2r-var-to-this
    "rwi" 'js2r-wrap-buffer-in-iife
    "rwl" 'js2r-wrap-in-for-loop
    "k" 'js2r-kill
    "xmj" 'js2r-move-line-down
    "xmk" 'js2r-move-line-up))

(defun itome-react/post-init-tern ()
  (add-hook 'rjsx-mode-hook 'tern-mode)
  (spacemacs|hide-lighter tern-mode)
  (spacemacs//set-tern-key-bindings 'rjsx-mode))

(defun itome-react/post-init-web-beautify ()
  (spacemacs/set-leader-keys-for-major-mode 'rjsx-mode "=" 'web-beautify-js))
