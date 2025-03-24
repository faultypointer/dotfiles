;; don't show welcome screen
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; display line numbers in every buffer
(global-display-line-numbers-mode 1)


;; highlight current line
(hl-line-mode -1)

(recentf-mode 1)

(setq history-length 25)
(savehist-mode 1)

;; cmon helix
(save-place-mode 1)

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(setq use-dialog-box nil)

;; revert buffers when underlying files have chnaged
(global-auto-revert-mode 1)
;; revert dired and other buffers
(setq global-auto-revert-non-file-buffers t)


;; themes and colors

;; transparency lets goo
(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 80))

;; underlying theme
(load-theme 'modus-vivendi t)



;; packages
;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
