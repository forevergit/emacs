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




(provide 'init-default-var)


