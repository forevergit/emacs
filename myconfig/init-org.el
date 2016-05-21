
(setq org-src-fontify-natively t)

(with-eval-after-load 'org
  (setq org-agenda-files (quote ("~/.emacs.d/org")))
  ;; 24.5 error (setq org-agenda-files '("~/.emacs.d/org/gtd.org"))
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/org/gtd.org" "工作安排") "* TODO [#B] %i\n" :empty-lines 1))
	)


  )





(provide 'init-org)
