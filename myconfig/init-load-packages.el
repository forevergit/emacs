(when (>= emacs-major-version 24)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar hsh/packages '(
	       ;; --- Auto-completion ---
	       company
	       popwin
	       monokai-theme
	       hungry-delete
	       swiper
	       smartparens
	       js2-mode
	       ) "Default packages")

(setq package-selected-packages hsh/packages)

(defun hsh/packages-installed-p ()
    (loop for pkg in hsh/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (hsh/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg hsh/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))




;;开启最近浏览的
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;;智能删除空格
(require 'hungry-delete)
(global-hungry-delete-mode t)

;; 代码括号补全 smartparents
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;;js2-mode js ide config TODO error
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;;光标自动跟踪到新建的窗口
(require 'popwin)
(popwin-mode t)


(provide 'init-load-packages)
