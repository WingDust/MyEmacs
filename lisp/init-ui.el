
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)


;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 关闭启动帮助画
;;(setq inhibit-splash-screen 1)

;; fullsreen startup
(setq initial-frame-alist (quote ((fullscreen , maximized))))

;; line light
(global-hl-line-mode t)

;;打开行号
(global-linum-mode t)
(add-hook 'org-mode-hook #'linum-mode)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)


(provide 'init-ui)
