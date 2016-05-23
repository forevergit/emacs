

;;load package


(package-initialize)
(add-to-list 'load-path "~/.emacs.d/myconfig/")

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-load-packages)
(require 'init-theme)
(require 'init-default-var)
(require 'init-org)
(require 'init-mylib-emacs)
(require 'init-mylib-js)
(require 'init-keymapping)

;;all plugin config
(setq custom-file (expand-file-name "myconfig/customer.el" user-emacs-directory))
(load-file custom-file)









 













 





