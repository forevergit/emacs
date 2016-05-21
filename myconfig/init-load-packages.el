(when (>= emacs-major-version 24)
  (setq package-archives '(
			   ;;("melpa" . "http://melpa.org/packages/")
			   ("gnu"   . "http://elpa.zilongshanren.com/gnu/")
			   ("melpa" . "http://elpa.zilongshanren.com/melpa/")
			   ))
  )

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar hsh/packages '(
		       ;; --- Auto-completion ---
		       company
		       monokai-theme
		       hungry-delete
		       swiper
		       smartparens
		       popwin
		       js2-mode
		       ;;选择字符
		       expand-region
		       ;;多区域编辑
		       iedit
		       ;;番茄工作法
		       org-pomodoro
		       

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
;;高亮另一个括号
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;;在elisp编辑模式下 去掉' 单引号的自动补全
(sp-local-pair '(emacs-lisp-mode) "'" nil :actions nil)

;;
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it))))


;;js2-mode js ide config TODO error
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;;光标自动跟踪到新建的窗口
(require 'popwin)
(popwin-mode t)

;;C-= 选择文本
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


(provide 'init-load-packages)
