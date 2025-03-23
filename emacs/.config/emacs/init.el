;; don't show welcome screen
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; display line numbers in every buffer
(global-display-line-numbers-mode 1)

;; theme
(load-theme 'modus-vivendi t)

;; highlight current line
(hl-line-mode 1)
