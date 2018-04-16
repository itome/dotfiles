;;; packages.el --- Dart Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Alexey Nabrodov <Averrin@gmail.com>
;; URL: https://github.com/averrin/dart-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq itome-dart-packages
  '(
    flycheck
    company
    dart-mode
    (company-dart
     :location (recipe
      :fetcher github
      :repo "sid-kurias/company-dart"
      )
    )
  )
)

(defun itome-dart/post-init-company ()
  (spacemacs|add-company-hook dart-mode))

(defun itome-dart/post-init-company-dart ()
  (push 'company-dart company-backends-dart-mode))

(defun itome-dart/post-init-flycheck ()
  (add-hook 'dart-mode-hook 'flycheck-mode))

(defun itome-dart/init-dart-mode ()
  (use-package dart-mode
    :defer t
    :init
    (progn
      (electric-pair-mode 1)
      (setq dart-enable-analysis-server t))
    :config
    (progn
      (evil-define-key 'normal dart-mode-map
        (kbd ", g g") 'dart-goto
        (kbd ", g r") 'dart-find-refs
        (kbd ", =") 'dart-format
        (kbd ", h") 'dart-show-hover
        (kbd "SPC m g g") 'dart-goto
        (kbd "SPC m g r") 'dart-find-refs
        (kbd "SPC m =") 'dart-format
        (kbd "SPC m h") 'dart-show-hover)
    )))
