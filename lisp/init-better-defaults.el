
;; disable bell
(setq ring-bell-function 'ignore)


;; auto load file
(global-auto-revert-mode t)



;; abbrev auto al
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("wd" "my")
					    ))






;;
(setq make-backup-files nil)
(setq auto-save-default nil)



(recentf-mode 1)
(setq recentf-max-menu-item 25)
;;它的快捷键绑定可以用之后的插件 counsel 代替 
(global-set-key (kbd "C-x C-r") 'recentf-open-files)






;; show paren even in bracket pair inside

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "HightLight enclosing paren"
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (function fn))))
  )

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)




;; 关闭缩进 (第二天中被去除)
(electric-indent-mode 1)

(delete-selection-mode 1)


;; make the buffer auto indent by hotkey
(defun indent-buffer ()
  "Indent the currently actived buffer"
  ;;  (indent-rSpacemacsegion (point-min) (point-max))
  (indent-region (point-min) (point-max))
  )

(defun indent-region-or-buffer ()
  "Indent a region if selected ,otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region ")
	  )

      (progn
	(indent-buffer)
	(message "Indent buffer .")
	)

      )
    )
  )

;;;;;;;;auto Indent

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;;;;;;;Dired mode

;; concel Asking for delete and copy in Dired Mode
(setq dired-recursive-copies 'always)
					;(setq dired-recursive-deletes 'always)

;; concel open in new buffer in Dired mode
(put 'dired-find-alternate-file 'disabled nil)

;; it sentences need dired mode to load so
;; 
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; open currently buffer directory in dird mode
(require 'dired-x)

(setq dired-dwim-target t)



;; hide DOS system file's  link break such as `^M`
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

;; remove DOS system line bread

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))



















(provide 'init-better-defaults)
