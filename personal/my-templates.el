;;; my-templates.el --- Customizations for my templates directory:

;; This file is not part of GNU Emacs.

;;; Commentary:
;; I couldn't find a tool that was quite right for what I wanted
;; So, I created this, which seems to work fairly well...
;; Further tweaks may be added later. I wish it had the ability
;; to replace keywords with values upon creation...

;; Various tweaks to skeletor for my setup...

;;; Code:

;; Project Templates:
(defvar template-root (expand-file-name
                       "personal/project-templates" user-emacs-directory))

(defun my-prelude/copy-project-template ()
  "Copy a template subdir from `template-root' intospecified destination."
  (interactive)
  (let* ((template (completing-read "Choose template: "
                                    (directory-files template-root nil "^[^.]" t)))
         (template-dir (expand-file-name template template-root))
         (project-name (read-string "New project name: "))
         (destination-root (read-directory-name
                            "Where to create the new project: "))
         (target-dir (expand-file-name project-name destination-root)))
    (if (file-exists-p target-dir)
        (error "Target directory already exists: %s" target-dir)
      (copy-directory template-dir target-dir nil nil t)
      (message "Created project '%s' from template '%s'" project-name template))))


(provide 'my-skeletor-customizations)
;;; my-projectile-customizations ends here
