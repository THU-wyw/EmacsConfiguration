;; author: chinazhangjie
;; e-mail: chinajiezhang@gmail.com

;; 指针颜色设置为白色

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-cursor-color "white")
;; 鼠标颜色设置为白色
(set-mouse-color "white")

;; all backups goto ~/.backups instead of the current directory
(setq backup-directory-alist (quote (("." . "~/.emacs.d/auto-save-list"))))

;; set cmake syntax
(add-to-list 'load-path "~/.emacs.d/misc/")
(require 'cmake-mode)
(setq auto-mode-alist
	  (append '(("CMakeLists\\.txt\\'" . cmake-mode)
				("\\.cmake\\'" . cmake-mode))
			  auto-mode-alist))

;; 从color-theme中获取
;; 网上下载color-theme.el，放到加载路径(／usr/share/emacs/site-lisp )下
;; M-x color-theme-select,鼠标左键选中，回车查看效果
;; d查看信息，将出现如下信息:
;; color-theme-matrix is an interactive Lisp function in `color-theme.el'.
;; (color-theme-matrix)
;; Color theme by walterh@rocketmail.com, created 2003-10-16.
;; 选择(color-theme-blue-mood)即可

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'color-theme)
(color-theme-initialize)
;; (setq color-theme-is-global t)
;; (color-theme-dark-blue2)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'molokai t)

(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; 使用tabbar.el
(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "") 'tabbar-backward-group)
(global-set-key (kbd "") 'tabbar-forward-group)
(global-set-key (kbd "") 'tabbar-backward)
(global-set-key (kbd "") 'tabbar-forward)


;; 一打开就起用 text 模式。  
(setq default-major-mode 'text-mode)

;; 语法高亮
(global-font-lock-mode t)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p) 

;; 显示括号匹配 
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 显示时间，格式如下
(display-time-mode 1)  
(setq display-time-24hr-format t)  
(setq display-time-day-and-date t)  

(transient-mark-mode t) 

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t) 

;; 在标题栏提示你目前在什么位置
(setq frame-title-format "王宇炜@%b")  

;; 默认显示 80列就换行 
(setq default-fill-column 80) 

;; 去掉工具栏
(tool-bar-mode 0)

;;去掉菜单栏
(menu-bar-mode 0)

;; 去掉滚动栏
(scroll-bar-mode 0)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))

;; 显示列号
(setq column-number-mode t)
(setq line-number-mode t)

;; 使用 C++ mode， 感谢csdn yq_118
(add-to-list 'auto-mode-alist (cons "\\.h$" #'c++-mode))

;; 设置缩进
(setq c-basic-offset 4)
(setq indent-tabs-mode 0)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))


;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)

;; 启动窗口大小
(setq default-frame-alist
      '((height . 35) (width . 85) (menu-bar-lines . 20) (tool-bar-lines . 0))) 
(put 'upcase-region 'disabled 0)

;; set transparent effect
(global-set-key [(f6)] 'loop-alpha)
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
	((lambda (a ab)
	   (set-frame-parameter (selected-frame) 'alpha (list a ab))
	   (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
	   ) (car h) (car (cdr h)))
	(setq alpha-list (cdr (append alpha-list (list h))))
	)
)

(loop-alpha)
