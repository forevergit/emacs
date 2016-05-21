

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)


;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;优化搜索C-s swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key "\C-h\ \C-f" 'find-function)
(global-set-key "\C-h\ \C-v" 'find-variable)
(global-set-key "\C-h\ \C-k" 'find-function-on-key)


;;对整个git项目下的文件进行搜索 --todo 有问题某些模式无法工作需排查

(global-set-key (kbd "C-c p f") 'counsel-git)

;;代码缩进
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;hippie-expand 在company没法补全的情况下，手动补全
(global-set-key (kbd "C-M-/") 'hippie-expand)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


;;自动获取光标所在的词作为搜索条件
(global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "M-s i") 'counsel-imenu)

;;如果一个buffer没有修改，关闭不用提示
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;;快速打开org模板
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-keymapping)

