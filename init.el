;; TODO replace hard references to ~/.emacs.d with variable user-emacs-directory

;; External config
(let ((local "~/.emacs.d/local.el"))
  (if (file-exists-p local)
      (load local)))

;; Startup
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq initial-major-mode 'text-mode)

;; Backups
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs.d/backups"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
 create-lockfiles nil)
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
(global-whitespace-mode 1)
(setq whitespace-style '(face tabs spaces empty tab-mark space-mark))
(set-face-background 'whitespace-space nil)
(set-face-foreground 'whitespace-space "dim gray")
(set-face-background 'whitespace-tab nil)
(set-face-foreground 'whitespace-tab "dim gray")

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
(mapc
 (lambda (f) (add-hook 'nxml-mode-hook f))
 (list
  (lambda () (setq-local indent-tabs-mode t))
  'linum-mode))
;; (defmacro add-hooks (hook &rest fns)
;;   `(mapc (lambda (f) (add-hook (quote ,hook) f))
;;          ,fns))
;; (add-hooks nxml-mode-hook
;;            (lambda () (setq-local indent-tabs-mode t))
;;            'linum-mode)

;; UI
(tool-bar-mode -1)
(load-theme 'wombat)

;; Common code configs
(mapc (lambda (h) (add-hook h 'linum-mode))
      '(java-mode-hook))
