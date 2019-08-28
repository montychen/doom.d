;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; ======= 显示 display  =========================================================
;;
;; 使用 monokai 主题。 要在packages.el中安装  monokai-theme
(require 'monokai-theme)
(setq doom-theme 'monokai)
(setq doom-font (font-spec :family "Source Code Pro" :size 15))  ;; 使用Source Code Pro 字体 大小 15
(setq initial-frame-alist (quote ((fullscreen . maximized))))   ;; 默认全屏
(setq evil-visual-state-cursor 'hbar)  ;; 默认是 hollow空心块， 会造成在手动选中高亮时，最后一个字符看不见，这里改成 hbar下划线。

;; 把背景色改成 jonathan blow 使用的绿色背景: #0B2B2D
;; 可通过 M-x list-faces-display 来查看和显示有关的配置信息。
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

 '(region ((t (:background "#FF9933" :foreground "black"))))  ;; 手动选中高亮颜色
 '(evil-ex-lazy-highlight ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 '(iedit-occurrence ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色

 '(swiper-background-match-face-1 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 '(swiper-background-match-face-2 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 '(swiper-background-match-face-3 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 '(swiper-background-match-face-4 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 '(swiper-match-face-1 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 '(swiper-match-face-2 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 '(swiper-match-face-3 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 '(swiper-match-face-4 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 )



;; ======= 编辑   =========================================================
;;
;; evil-multiedit 方式: 使用 v 选中文本后，键入 R 可以进入多光标编辑模式. 这时使用 C-n C-p 可以在匹配文本中轮换，按 RET 反选当前匹配项.
;;
;;调整缩进、格式： 系统默认也是keymap到 C-M-\, 不过只是对选中区域有效，这里让当前激活的buffer也可以。
(defun dj@indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun dj@indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (dj@indent-buffer)
        (message "Indent buffer.")))))
(global-set-key (kbd "C-M-\\") 'dj@indent-region-or-buffer)


;;光标在括号内时就高亮包含内容的两个括号
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
        (t (save-excursion
             (ignore-errors (backward-up-list))
             ad-do-it)))
  )


;; c_c++ 缩进 4 个空格
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)
(setq c-default-style "linux")


(remove-hook 'org-mode-hook #'auto-fill-mode)  ; 在org，中英混排出现空格时，禁止自动折行生成真正的新行。



;; ======= 搜索匹配    =========================================================
;;
;; *：evil normal模式  *  自动匹配光标下的单词，高亮显示， 可用n匹配下项。
;; / 绑定到evil-ex-search-forward：  用于需要手动输入的时候。
;; SPC / b 绑定到 counsel-grep-or-swiper ： 用于手动输入， 下面会有所有匹配结果的汇总。
;; C-s 默认绑定到 isearch-forward: 不好用， swiper-isearch or swiper-isearch-thing-at-point 感觉没counsel-grep-or-swiper好用。
(defun dj@counsel-grep-or-swiper-at-point () ; 增强counsel-grep-or-swiper，默认可以自动搜索光标下的单词、或选中的。
  "C-s 默认绑定到 isearch-forward: 不好用。通过增强counsel-grep-or-swiper，可以自动搜索光标下的单词、或选中的。"
  (interactive)
  (if (window-minibuffer-p)
      (let (bnd str regionp)
        (with-ivy-window
          (setq bnd
                (if (setq regionp (region-active-p))
                    (prog1 (cons (region-beginning) (region-end))
                      (deactivate-mark))
                  (bounds-of-thing-at-point 'symbol)))
          (setq str (buffer-substring-no-properties (car bnd) (cdr bnd))))
        (insert str)
        (unless regionp
          (ivy--insert-symbol-boundaries)))
    (let (thing)
      (if (use-region-p)
          (progn
            (setq thing (buffer-substring-no-properties
                         (region-beginning) (region-end)))
            (goto-char (region-beginning))
            (deactivate-mark))
        (let ((bnd (bounds-of-thing-at-point 'symbol)))
          (when bnd
            (goto-char (car bnd)))
          (setq thing (ivy-thing-at-point))))
      (counsel-grep-or-swiper thing))))
(global-set-key (kbd "C-s") 'dj@counsel-grep-or-swiper-at-point)

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



;; ======= keymap    =========================================================
;;
(map!
 :nvi "C-k" #'kill-line                 ; 在正常、可视、插入模式下, C-k 删除当前行光标后的内容。
 :nvi "C-e" #'doom/forward-to-last-non-comment-or-eol ; 在正常、可视、插入模式下, C-e 去到行尾。
 :nvi "M-;" #'comment-dwim     ; 在正常、可视、插入模式下, M-; 在行尾添加注释。s-/  是对整行或选中区域进行注释或取消注释。
 :nvi "s-/" #'comment-line     ; S代表Shift键盘；s代表Command键，默认s-/绑定到evil-commentary-line， 感觉没comment-line好用

 )

(map! :leader
      (:prefix ("t" . "toggle")         ; SPC t w  自动折行
        :desc "自动折行"         "v" #'visual-line-mode	; 自动折行，虚拟成n行，上下行、头尾移动方便。 toggle-truncate-lines自动折行，但逻辑上还是一行，不好用。
        ;; :desc "org显示内嵌的图片"       "m" #'org-toggle-inline-images ; 在org-mode下， 这个函数系统已经默认绑定到 z i
        ))
