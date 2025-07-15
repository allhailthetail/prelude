;;; my-yasnippet-customizations.el --- Customizations for yasnippet

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Customizations for yasnippet

;;; Code:
(require 'yasnippet)

;; Add your custom snippet directory:
;; NOTE: for some reason, you can't delete or remove the default snippets dir.
(add-to-list 'yas-snippet-dirs
             (expand-file-name "personal/custom_yasnippets" user-emacs-directory))

;; Install pre-made list of snippets
(dolist (pkg '(yasnippet-snippets))
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Load YAS globally:
(yas-global-mode 1)
;; Should loading of YAS get disruptive:
;; Load YAS for these types of files:
;; (yas-reload-all)
;; (add-hook 'org-mode #'yas-minor-mode)

(provide 'my-yasnippet-customizations.el)
;;; my-yasnippet-customizations ends here
