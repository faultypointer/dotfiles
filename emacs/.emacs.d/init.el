;;; ...  -*- lexical-binding: nil -*-(

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)



;; denote
(use-package denote
       :ensure t
       :hook (dired-mode . denote-dired-mode)
       :bind
       (("C-c n n" . denote)
        ("C-c n r" . denote-rename-file)
        ("C-c n l" . denote-link)
        ("C-c n b" . denote-backlinks)
        ("C-c n d" . denote-dired)
        ("C-c n g" . denote-grep))
       :config
       (setq denote-directory (expand-file-name "~/Git/Notes/"))

       ;; Automatically rename Denote buffers when opening them so that
       ;; instead of their long file name they have, for example, a literal
       ;; "[D]" followed by the file's title.  Read the doc string of
       ;; `denote-rename-buffer-format' for how to modify this.
       (denote-rename-buffer-mode 1))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8d94358eea31a11791329704421ab476baf52109efd0377bf29bcf4c636ed176"
     default))
 '(package-selected-packages '(denote)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
