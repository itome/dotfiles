;;
;; Emacs editor configurations
;;

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

(provide 'editor-config.el)
