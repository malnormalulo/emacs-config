;; Meta-config
(setq custom-file "~/.emacs.d/custom.el")
(load "~/.emacs.d/custom.el")

;; Startup
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq initial-major-mode 'text-mode)

;; Backups
(setq
 backup-by-copying t
 backup-directory-alist
 '(("." . "~/.emacs.d/backups"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(savehist-mode 1)

;; File settings
(setq require-final-newline t)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Global behavior
(global-set-key (kbd "M-<left>") 
                (lambda ()
                  (interactive)
                  (other-window -1)))
(global-set-key (kbd "M-<right>") 'other-window)

;; Whitespace
(setq default-tab-width 2)
(setq-default indent-tabs-mode nil)
(global-whitespace-mode)
(setq whitespace-style '(face trailing tabs empty tab-mark))

;; Text editing
(delete-selection-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Code editing
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)

;; JavaScript
(setq js-indent-level 2
      js-switch-indent-offset 2)

;; XML
(add-hook
 'nxml-mode-hook
 (lambda () (setq-local indent-tabs-mode t)))

;; UI-specific settings
(if (display-graphic-p)
    (load "~/.emacs.d/init-gui.el")
  (load "~/.emacs.d/init-terminal.el"))
