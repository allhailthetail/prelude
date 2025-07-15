;;; my-projectile-customizations.el --- Customizations for projectile:

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Various tweaks to projectile for my setup...

;; Note on Projectile's discovery capabilities:
;;   I've opted for now to NOT do auto discovery, because I use TRAMP...
;;   So, I may need to run M-x projectile-discover-projects-in-search-path
;;   (which I had to do initially) and I suspect each time I create a new?
;;   I may also have to remove old/non-existing via:
;;   M-x projectile-cleanup-known-projects.
;;   Corresponding auto: (setq projectile-cleanup-known-projects t)

;;; Code:

;; Define where Projectile will look for my projects:
;;   Note: if I had additional options inside Projects like Work, School...
;;         I'd use a cons block ("~/Documents/Projects/" . 1)
;;         So that Projectile evaluates contents 1 level deep...
;;         .../Projects/*/{projects} <--  Something like that...
(setq projectile-project-search-path '("~/Documents/Projects/"
                                      "~/playground"
                                      "~/.emacs.d.prelude/personal/"))

(provide 'my-projectile-customizations)
;;; my-projectile-customizations ends here
