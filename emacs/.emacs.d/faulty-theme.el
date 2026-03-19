(deftheme faulty
  "Created 2026-03-18.")

(custom-theme-set-variables
 'faulty
 '(connection-local-profile-alist '((vc-git-connection-default-profile (vc-git--program-version))))
 '(connection-local-criteria-alist '(((:application vc-git) vc-git-connection-default-profile))))

(provide-theme 'faulty)
