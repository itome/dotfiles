;;; -*-coding: utf-8 -*-
;;; smart-backspace.el intellj like backspace

;; Copyright (C) 2017  takeshi tsukamoto

;; Author: George Kettleborough <g.kettleborough@member.fsf.org>
;; Created: 20170909
;; Version: 0.1.0
;; Status: experimental

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; backspace like intellij idea

;; set keybindings for smart-backspace
;; example
;;   (define-key evil-insert-state-map [?\C-?] 'smart-backspace)
;;   (define-key key-translation-map [?\C-h] [?\C-?])

;;; Code:
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

(provide 'smart-backspace)
;;; magit-pretty-graph.el ends here
