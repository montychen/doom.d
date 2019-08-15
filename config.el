;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; 使用 monokai 主题。 要在packages.el中安装  monokai-theme
(require 'monokai-theme)
(setq doom-theme 'monokai)
(setq doom-font (font-spec :family "Source Code Pro" :size 15))  ;; 使用Source Code Pro 字体 大小 15
(setq initial-frame-alist (quote ((fullscreen . maximized))))   ;; 默认全屏

(setq evil-visual-state-cursor 'hbar)  ;; 默认是 hollow空心块， 会造成在手动选中高亮时，最后一个字符看不见，这里改成 hbar下划线。

;; 把背景色改成 jonathan blow 使用的绿色背景: #0B2B2D
(custom-set-faces
 '(default ((t (:background "#0B2B2D"))))

 '(solaire-default-face ((t (:background "#0B2B2D"))))
 '(solaire-fringe-face ((t (:background "#0B2B2D"))))
 '(solaire-hl-line-face ((t (:background "#0B2B2D"))))
 '(solaire-line-number-face ((t (:background "#0B2B2D"))))
 '(solaire-minibuffer-face ((t (:background "#0B2B2D"))))
 '(solaire-mode-line-face ((t (:background "#0B2B2D"))))
 '(solaire-mode-line-inactive-face ((t (:background "#0B2B2D"))))
 '(solaire-org-hide-face ((t (:background "#0B2B2D"))))

 '(region ((t (:background "#82b626" :foreground "black"))))  ;; 手动选中高亮颜色
 '(evil-ex-lazy-highlight ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 )


;;调整缩进、格式： 系统默认也是keymap到 C-M-\, 不过只是对选中区域有效，这里让当前激活的buffer也可以。
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
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)


;;光标在括号内时就高亮包含内容的两个括号
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
        (t (save-excursion
             (ignore-errors (backward-up-list))
             ad-do-it)))
  )


;;配置 Occur Mode 使其默认搜索当前被选中的或者在光标下的字符串, M-s o 默认就有，这里只是增强：默认可以搜索广标下的字符。
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)



(global-set-key (kbd "C-k") 'kill-line)
