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
    (dart-mode :location (recipe
      :fetcher github
      :repo "sid-kurias/dart-mode"
      )
    )
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
  (spacemacs/add-flycheck-hook 'dart-mode))

(defun itome-dart/init-dart-mode ()
  (use-package dart-mode
    :defer t
    :init
    (progn
      (add-hook 'dart-mode-hook #'(lambda () (modify-syntax-entry ?_ "w"))))
    :config
    (progn
        (spacemacs/set-leader-keys
        ;; (spacemacs/set-leader-keys-for-major-mode 'dart-mode
          "mj" 'dart-jump-to-defn
          "mf" 'dartfmt
          "mi" 'dart-imports
          "ms" 'dart-sort-members
          )
    )
))
