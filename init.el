;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybinding)
(require 'init-org)
(require 'init-eaf)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)

;;(add-to-list 'load-path "~/.emacs.d/emmacs-application-framework/")
;; (require 'eaf)
(load-file "~/.emacs.d/site-lisp/emacs-application-framework/eaf.el")
(load-file "~/.emacs.d/site-lisp/emacs-application-framework/evil-eaf.el")


