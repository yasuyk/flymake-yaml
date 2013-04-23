;;; flymake-yaml.el --- A flymake handler for YAML

;; Copyright (C) 2013 Yasuyuki Oka

;; Author: Yasuyuki Oka <yasuyk@gmail.com>
;; Version: 0.0.1
;; URL: https://github.com/yasuyk/flymake-yaml
;; Package-Requires: ((flymake-easy "0.1"))
;; Keywords: yaml

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Based in part on http://d.hatena.ne.jp/kitokitoki/20120306/p1
;;
;; Usage:
;;   ;; If using ELPA package, the following configuration is not necessary
;;   (require 'flymake-yaml)
;;   (add-hook 'yaml-mode-hook 'flymake-yaml-load)
;;
;; Uses flymake-easy, from https://github.com/purcell/flymake-easy

;;; Code:

(require 'flymake-easy)

(defconst flymake-yaml-err-line-patterns
   ;; Syck error message
  '(("syntax error on line \\([0-9]+\\), col \\([0-9]+\\): `\\(.*\\)'" nil 1 2 3)
    ;; Psych error message
    (".*: \\(.*\\) at line \\([0-9]+\\) column \\([0-9]+\\)" nil 2 3 1)))

(defconst flymake-yaml-command-path
  (expand-file-name (concat
                     (file-name-directory load-file-name)
                     "emacs-yaml-syntax-check")))

(defun flymake-yaml-command (filename)
  "Construct a command that flymake can use to check yaml source.
Argument FILENAME
    YAML file name."
  (list "emacs-yaml-syntax-check" filename))

;;;###autoload
(defun flymake-yaml-load ()
  "Configure flymake mode to check the current buffer's YAML syntax."
  (interactive)
  (flymake-easy-load 'flymake-yaml-command
                     flymake-yaml-err-line-patterns
                    'tempdir
                     "yml"))

;;;###autoload
(add-to-list 'yaml-mode-hook 'flymake-yaml-load)

(provide 'flymake-yaml)

;; Local Variables:
;; coding: utf-8
;; eval: (checkdoc-minor-mode 1)
;; End:

;;; flymake-yaml.el ends here
