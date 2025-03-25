;; main settings
(setq
 ;; no welcome screen
 inhibit-startup-message t

 ;; auto-save-mode to save current file not backup
 auto-save-default nil

 ;; no backups
 make-backup-files nil

 ;; silence compiler warnings
 native-comp-async-report-warnings-errors nil)

;; main modes
(menu-bar-mode -1)  ;; no menu bar
(tool-bar-mode -1)  ;; no tool bar
(scroll-bar-mode -1) ;; no scroll bar
(savehist-mode 1)  ;; minibuffer history
(global-display-line-numbers-mode 1) ;; line numbers
(global-auto-revert-mode 1)  ;; revert buffers when underlying files have chnaged
(hl-line-mode -1)  ;; don't highlight current line
(recentf-mode 1)
(save-place-mode 1) ;; save point place (cmon helix)
(tab-bar-history-mode 1) ;; remember previous tab window config


(setq history-length 25)

;; tabs to spaces
(setq-default indent-tabs-mode nil
	      tab-width 2)

;; icomplete more convinient
;; breaks config idk how `Symbol's value as variable is void: icomplete-fido-mode-map`
;; (keymap-set icomplete-fido-mode-map "M-h" 'icomplete-fido-backward-updir)
;; (keymap-set icomplete-fido-mode-map "TAB" 'icomplete-force-complete)




(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(setq use-dialog-box nil)

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






;; org mode

;; languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))

;; use sly to eval lisp code block instead of slime
(setq org-babel-lisp-eval-fn #'sly-eval)
