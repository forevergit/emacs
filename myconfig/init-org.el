
(setq org-src-fontify-natively t)

(with-eval-after-load 'org
  (setq org-agenda-files (quote ("~/.emacs.d/org")))
  ;; 24.5 error (setq org-agenda-files '("~/.emacs.d/org/gtd.org"))
  (setq org-capture-templates
	'(
	  ("t" "Todo" entry (file+headline "~/.emacs.d/org/gtd.org" "工作安排") "* TODO [#B] %i\n" :empty-lines 1)
	  ("c" "Chrome link to org node" entry (file+headline "~/.emacs.d/org/gtd.org" "Quick notes")
	   "* TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
	   :empty-lines 1)
	  )))

;;从mac浏览器获取URL到org文档中
(defun hsh/insert-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  insert (hsh/retrieve-chrome-current-tab-url))

;;从mac浏览器获取URL到org文档中
(defun hsh/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (let ((result (do-applescript
		 (concat
		  "set frontmostApplication to path to frontmost application\n"
		  "tell application \"Google Chrome\"\n"
		  " set theUrl to get URL of active tab of first window\n"
		  " set theResult to (get theUrl) \n"
		  "end tell\n"
		  "activate application (frontmostApplication as text)\n"
		  "set links to {}\n"
		  "copy theResult to the end of links\n"
		  "return links as string\n"))))
    (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))





(provide 'init-org)
