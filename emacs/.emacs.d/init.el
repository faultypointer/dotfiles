;; main settings --------------------------------------------------------------------------------------------
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
(set-frame-parameter nil 'alpha-background 85)
(add-to-list 'default-frame-alist '(alpha-background . 85))

;; underlying theme
(load-theme 'modus-vivendi t)



;; packages--------------------------------------------------------------------------------------------------
;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; org mode --------------------------------------------------------------------------------------------------

;; export markdown
(require 'ox-md)

;; languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))

;; use sly to eval lisp code block instead of slime
(setq org-babel-lisp-eval-fn #'sly-eval)

;; hide emphasis markers (bold italic code etc markers)
;; still debating whether to do it or not
(setq org-hide-emphasis-markers t)

;; better bullets (also broken)
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-begining 1) (match-end 1) "•"))))))

;; better header bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; header font sizes
;; (let* ((variable-tuple (cond ((x-list-fonts "Fira Code")     '(:font "Fira Code"))
;;                              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                              ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                              (nil (warn "Cannot find a Sans Serif Font. Install Fira Code."))))
;;        (base-font-color     (face-foreground 'default nil 'default))
;;        (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;; (custom-theme-set-faces 'user
;;                           `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;                           `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
;;                           `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
;;                           `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
;;                           `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

(with-eval-after-load 'org-faces
  (dolist (face '(org-level-1 org-level-2 org-level-3 org-level-4 
                  org-level-5 org-level-6 org-level-7 org-level-8 
                  org-document-title))
    (set-face-attribute face nil 
                        :font "Fira Code"
                        :weight 'bold
                        :height (pcase face
                                  ('org-level-1 1.75)
                                  ('org-level-2 1.5)
                                  ('org-level-3 1.25)
                                  ('org-level-4 1.1)
                                  (_ 1.0)))))


;; custom functions and stuffs----------------------------------------------------------------------------------
 (define-skeleton org-header-skeleton
"Header info for an Org file."
"Title: ""#+TITLE: " str " \n"
"#+AUTHOR: " user-full-name "\n"
"#+DATE: " (format-time-string "%Y-%m-%d") "\n")

(global-set-key [C-S-f1] 'org-header-skeleton) 

;; init config in i register
(set-register ?i (cons 'file user-init-file))
