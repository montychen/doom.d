;; ;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; ;; Place your private configuration here
;; ;; ======= 显示 display  =========================================================
;; ;;
;; (use-package monokai-theme              ;; 使用 monokai 主题。 要在packages.el中安装  monokai-theme
;;   :config
;;   (setq doom-theme 'monokai
;;         monokai-highlight-line "black"    ; 当前行高亮背景色
;;         ))
(setq doom-font (font-spec :family "Source Code Pro" :size 16))  ;; 使用Source Code Pro 字体 大小 15

;; 给org-mode单独设置字体, 稍大一点 参考：  https://pumpkinblog.top/post/org_set_fonts/
(with-eval-after-load 'org
  (defun org-buffer-face-mode-variable ()
    (interactive)
    (make-face 'my-org-face)  ;; 创建一个自己的face
    (set-face-attribute 'my-org-face nil  ;; 配置这个face
                        :font "Source Code Pro 17"  ;; 设置英文字体,  把org-mode的字体设的稍大一点
                        ;; 设置中文字体，如果不需设置中文字体可以去掉这一行
                        ;; :fontset (create-fontset-from-fontset-spec (concat "-*-*-*-*-*--*-*-*-*-*-*-fontset-org" ",han:翩翩体-简"))
                        )
    (setq buffer-face-mode-face 'my-org-face) ;; 指定buffer-face的face为自己定义的那个face
    (buffer-face-mode))
  (add-hook 'org-mode-hook 'org-buffer-face-mode-variable))   ;; org-mode-hook 这个 function


(setq initial-frame-alist (quote ((fullscreen . maximized))))   ;; 默认全屏
(setq evil-visual-state-cursor 'hbar)  ;; 默认是 hollow空心块， 会造成在手动选中高亮时，最后一个字符看不见，这里改成 hbar下划线。


;; ;; 可通过 M-x list-faces-display 来查看和显示有关的配置信息。
(custom-set-faces
 ;; '(default ((t (:background "#0B2B2D"))))   ;; 把背景色改成 jonathan blow 使用的绿色背景: #0B2B2D

 ;;  '(solaire-default-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-fringe-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-hl-line-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-line-number-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-minibuffer-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-mode-line-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-mode-line-inactive-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-org-hide-face ((t (:background "#0B2B2D"))))

 ;; 设置org标题1-8级的字体大小和颜色，颜色摘抄自monokai。;希望org-mode标题的字体大小和正文一致，设成1.0， 如果希望标题字体大一点可以设成1.2
 '(org-level-1 ((t (:inherit outline-1 :height 1.2  :foreground "#FD971F")))) ; monokai-orange "#FD971F"
 '(org-level-2 ((t (:inherit outline-2 :height 1.2  :foreground "#A6E22E")))) ; monokai-green "#A6E22E"
 '(org-level-3 ((t (:inherit outline-3 :height 1.2  :foreground "#66D9EF")))) ; monokai-blue "#66D9EF"
 '(org-level-4 ((t (:inherit outline-4 :height 1.2  :foreground "#E6DB74")))) ; monokai-yellow "#E6DB74"
 '(org-level-5 ((t (:inherit outline-5 :height 1.2  :foreground "#A1EFE4")))) ; monokai-cyan "#A1EFE4"
 '(org-level-6 ((t (:inherit outline-6 :height 1.2  :foreground "#A6E22E")))) ; monokai-green "#A6E22E"
 '(org-level-7 ((t (:inherit outline-7 :height 1.2  :foreground "#F92672")))) ; monokai-red "#F92672"
 '(org-level-8 ((t (:inherit outline-8 :height 1.2  :foreground "#66D9EF")))) ; monokai-blue "#66D9EF"

 '(region ((t (:background "#FF9933" :foreground "black"))))  ;; 手动选中高亮颜色
 ;; '(evil-ex-lazy-highlight ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 ;; '(iedit-occurrence ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色

 ;; '(swiper-background-match-face-1 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 ;; '(swiper-background-match-face-2 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 ;; '(swiper-background-match-face-3 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 ;; '(swiper-background-match-face-4 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 ;; '(swiper-match-face-1 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 ;; '(swiper-match-face-2 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 ;; '(swiper-match-face-3 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 ;; '(swiper-match-face-4 ((t (:background "#FF9933" :foreground "black"))))  ;; /搜索匹配高亮颜色
 ) ;; end custom-set-faces


;; (use-package golden-ratio   ; 自动黄金分割窗口大小。
;;   :config
;;   (golden-ratio-mode 1)
;;   )

;; (use-package centered-cursor-mode       ; 设置默认当前行居中
;;   :config
;;   (global-centered-cursor-mode)
;;   )

;; ;; ;; ======= 编辑   =========================================================
;; ;;
;; ;; evil-multiedit 方式: 使用 v 选中文本后，键入 R 可以进入多光标编辑模式. 这时使用 C-n C-p 可以在匹配文本中轮换，按 RET 反选当前匹配项.
;; ;;
;; ;;调整缩进、格式： 系统默认也是keymap到 C-M-\, 不过只是对选中区域有效，这里让当前激活的buffer也可以。
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


;; ;;光标在括号内时就高亮包含内容的两个括号
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
        (t (save-excursion
             (ignore-errors (backward-up-list))
             ad-do-it)))
  )


;; ;; 设置默认缩进 4 个空格， tab也是4个空格
;; (setq-default c-basic-offset 4
;;               tab-width 4
;;               indent-tabs-mode nil      ; t 使用 TAB 作格式化字符  nil 使用空格代替tab作格式化字符
;;               tab-always-indent t )
;; (setq c-default-style "linux")
;; (add-hook 'c-mode-common-hook   ; 强制c/c++ 使用 4个空格缩进, 如果只是c++，可以用c++-mode-hook
;;           '(lambda()
;;              (setq c-basic-offset 4)
;;              (c-set-offset 'substatement-open 0)
;;              ))


;; ;; 在org，中英混排出现空格时，禁止自动折行生成真正的新行。
(remove-hook 'org-mode-hook #'auto-fill-mode)



;; ;; ======= 搜索匹配    =========================================================
;; ;;
;; ;; *：evil normal模式  *  自动匹配光标下的单词，高亮显示， 可用n匹配下项。
;; ;; zt zz zb： evil nomal 模式下，把当前行移动到屏幕顶部、总部、底部。
;; ;; H  L:evil nomal 模式下，把光标移动到屏幕顶部， 底部。 gg是移动到到第一行， G是移动到最后一行。
;; ;; / 绑定到evil-ex-search-forward：  用于需要手动输入的时候。
;; ;; SPC / b 绑定到 counsel-grep-or-swiper ： 用于手动输入， 下面会有所有匹配结果的汇总。
;; ;; C-s 默认绑定到 isearch-forward: 不好用， swiper-isearch or swiper-isearch-thing-at-point 感觉没counsel-grep-or-swiper好用。
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

;; ;;配置 Occur Mode 使其默认搜索当前被选中的或者在光标下的字符串, M-s o 默认就有，这里只是增强：默认可以搜索广标下的字符。
;; (defun occur-dwim ()
;;   "Call `occur' with a sane default."
;;   (interactive)
;;   (push (if (region-active-p)
;;             (buffer-substring-no-properties
;;              (region-beginning)
;;              (region-end))
;;           (let ((sym (thing-at-point 'symbol)))
;;             (when (stringp sym)
;;               (regexp-quote sym))))
;;         regexp-history)
;;   (call-interactively 'occur))
;; (global-set-key (kbd "M-s o") 'occur-dwim)



;; ;; ======= keymap    =========================================================
;; ;;
(map!
 :nvi "C-k" #'kill-line                 ; 在正常、可视、插入模式下, C-k 删除当前行光标后的内容。
 :nvi "C-e" #'doom/forward-to-last-non-comment-or-eol ; 在正常、可视、插入模式下, C-e 去到行尾。
 :nvi "M-;" #'comment-dwim     ; 在正常、可视、插入模式下, M-; 在行尾添加注释。s-/  是对整行或选中区域进行注释或取消注释。
 :nvi "s-/" #'comment-line)     ; S代表Shift键盘；s代表Command键，默认s-/绑定到evil-commentary-line， 感觉没comment-line好用



(map! :leader
      (:prefix ("t" . "toggle")                               ;  SPC t 切换 toggle
        ;; :desc "当前行居中"                  "-" #'centered-cursor-mode) ; 切换当前行居中
        ;;         :desc "自动调整窗口大小"             "w" #'golden-ratio-mode; 切换自动调整当前窗口大小
        ;;   ;;; deprecated    :desc "自动折行"                   "v" #'visual-line-mode    ; 系统提供了word-wrap模块，启用后，可通过 SPC t w 切换。自动折行，虚拟成n行，上下行、头尾移动方便。 toggle-truncate-lines自动折行，但逻辑上还是一行，不好用。
        ;;   ;;; deprecated      ;; :desc "org显示内嵌的图片"       "m" #'org-toggle-inline-images ; 在org-mode下， 这个函数系统已经默认绑定到 z i
))
