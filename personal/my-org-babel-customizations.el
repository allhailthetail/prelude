;;; my-org-babel-customizations.el --- Customizations for org-babel

;; This file is not part of GNU Emacs.

;;; Commentary:

;; I've added these customizations to enable me to run
;; code in emacs org src blocks with C-c C-c,
;; which is disabled by default in this emacs spin-off?

;;; Code:

;; Install required packages if missing
(dolist (pkg '(ess ob-rust))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)       ;; C and C++ support
   (python . t)  ;; Python
   (rust . t)    ;; Rust (via ob-rust)
   (R . t)))     ;; R (via ESS or base R)

;; Add custom blocks to the beginning of new/empty org mode files:
;;   These are specifically intended to be customized and will
;;   likely vary wildly from use case to use case.
(defun my-prelude/org-new-file-header()
  "Insert a custom Org header in empty buffers."
  (when (and (string= (buffer-name)
                      (file-name-nondirectory (buffer-file-name)))
             (= (point-min) (point-max)))  ;; file is empty
    (let ((title (file-name-base (buffer-file-name))))
      (insert (format "#+title: %s\n" title))
      (insert "#+startup: indent overview hideblocks entitiespretty\n")
      (save-buffer))))

(add-hook 'org-mode-hook #'my-prelude/org-new-file-header)

(provide 'my-org-babel-customizations)
;;; my-org-babel-customizations ends here
