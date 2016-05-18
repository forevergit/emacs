
(setq-default cursor-type 'bar)
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)
(menu-bar-mode 1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 100)

;; 开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 高亮单前行
(global-hl-line-mode t)


;; 加载主题
(load-theme 'monokai 1)


(provide 'init-theme)
