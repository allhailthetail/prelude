;;; my-org-babel-customizations.el --- Customizations for org-babel

;; This file is not part of GNU Emacs.

;;; Commentary:

;; I've added these customizations to enable me to run
;; code in emacs org src blocks with C-c C-c,
;; which is disabled by default in this emacs spin-off?

;;; Code:

;; Install required packages if missing
(dolist (pkg '(ess ob-rust org-appear org-modern))
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Fix indentation Issue with Yasnippet and Org src blocks
(setq org-edit-src-content-indentation 0)

;; General Org UI tweaks:

;; Hide emphasis markers unless dwelling on them
(setq org-hide-emphasis-markers t
      org-appear-auto-emphasis t
      org-appear-autosubmarkers t
      org-appear-delay 2)
;; Disable subscript/superscript garbage
(setq org-use-sub-superscripts nil)

;; Minor Modes to Disable on Startup:
(defun my-prelude/org-def-minor-modes ()
       "Disable unnecessary minor modes on startup."
       (flycheck-mode -1)
       (flyspell-mode -1)
       (whitespace-mode -1)
       (org-modern-mode 1))
(add-hook 'org-mode-hook #'my-prelude/org-def-minor-modes)

;; Support these languages explicitly:
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)   ;; *shell support
   (C . t)       ;; C and C++ support
   (python . t)  ;; Python
   (rust . t)    ;; Rust (via ob-rust)
                 ;; NOTE: currently also requires rust-script via
                 ;;   cargo install rust-script
   (R . t)))     ;; R (via ESS or base R)

(setq org-confirm-babel-evaluate nil)

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

;; Treat gdb src blocks as sh for font-locking
(add-to-list 'org-src-lang-modes '("gdb" . sh))

;; Org Mode Custom Shortcuts:
(defun my-prelude/org-mode-custom-keys ()
  "Custom Keybindings for Org Mode."
  (local-set-key (kbd "C-c h") #'org-fold-hide-block-all))
(add-hook 'org-mode-hook #'my-prelude/org-mode-custom-keys)

(provide 'my-org-babel-customizations)
;;; my-org-babel-customizations ends here
