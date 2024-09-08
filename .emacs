;; 基本命令查阅：
;; 1. 查看所有键绑定：
;;    - 按 `C-h b`（即 `Ctrl` + `h` 然后 `b`）来查看当前缓冲区的所有键绑定及其对应的命令。

;; 2. 查看所有命令：
;;    - 按 `M-x`（即 `Alt` + `x` 或 `Esc` 然后 `x`），然后输入 `apropos-command` 并按 `Enter`。接着输入一个关键字，Emacs 会显示与该关键字相关的所有命令。

;; 3. 查看帮助文档：
;;    - 按 `C-h a`（即 `Ctrl` + `h` 然后 `a`）并输入一个关键字，Emacs 会显示与该关键字相关的所有命令。

;; 4. 查看快捷键帮助：
;;    - 按 `C-h k`（即 `Ctrl` + `h` 然后 `k`），然后按下你想了解的快捷键，Emacs 会显示该快捷键绑定的命令及其说明。

;; 如果有.emacs.d/init.el的话,配置指向它, 否则根据本文件安装通用配置
(if (file-exists-p "~/.emacs.d/init.el")
    (load-file "~/.emacs.d/init.el")
  (progn
    ;; 配置文件作为起始页
    (add-hook 'emacs-startup-hook
	      (lambda ()
		(find-file "~/.emacs")))
    ;; 初始化包管理器
    (require 'package)
    
    ;; 添加包源
    (setq package-archives
	  '(;; emacs安装源
	    ("gnu"   . "https://elpa.gnu.org/packages/")
	    ("melpa" . "https://melpa.org/packages/")
	    ("melpa-stable" . "https://stable.melpa.org/packages/")
	    ))

    ;; 初始化包管理器
    (package-initialize)

    ;; 刷新包列表（如果包列表没有被缓存）
    (unless package-archive-contents
      (package-refresh-contents))

    ;; emacs推荐插件列表
    
    ;; ;; 安装 use-package, 简易包管理工具
    ;; (unless (package-installed-p 'use-package)
    ;;   (package-install 'use-package))
    ;; ;; 使用 use-package
    ;; (require 'use-package)
    
    ;; ;; 安装 magit, github同步, git使用
    ;; (unless (package-installed-p 'magit)
    ;;   (package-install 'magit))
    ;; ;; 加载 magit 插件
    ;; (require 'magit)
    ;; ;; 可选：设置 magit 的快捷键
    ;; (global-set-key (kbd "C-x g") 'magit-status)
    ))
