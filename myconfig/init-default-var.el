;;(set-language-environment "UTF-8")
;;自动加载外部修改过的文件
(global-auto-revert-mode 1)
;; 关闭备份文件
(setq make-backup-files -1)
;; 关闭自动保存功能
(setq auto-save-default nil) 
;; 打开缩进
(electric-indent-mode 1)

;;启动开启代码补全
(global-company-mode t)
(delete-selection-mode t)

(fset 'yes-or-no-p 'y-or-n-p)


;;关闭提示音
(setq ring-bell-function 'ignore)

;;代码缩进 bind C-M-\
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;;手动代码补全hippie优化设置
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))


;;Dired Mode文件操作模式优化
;;删除or拷贝文件夹不提示递归， 默认yes
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;;当进入一个文件，如果父级目录有buff,删除父级目录的buff生成一个当前buffer
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;;打开当前文件的dired模式 快捷键C-x C-j
(require 'dired-x)


;;在elisp编辑模式下 去掉' 单引号的自动补全
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)



(provide 'init-default-var)


