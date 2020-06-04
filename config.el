;;; ============= doom emacs 常用指令  ==========================================
;; S代表Shift键盘；s代表Command键，M代表option键盘
;;
;;
;; z a 折叠开关  z m 全部折叠  z r 展开所有折叠  z o 展开当前所在的折叠
;; evil-multiedit 方式: 使用 v 选中文本后，键入 R 可以进入多光标编辑模式. 这时使用 C-n C-p 可以在匹配文本中轮换，按 RET 反选当前匹配项.

;; zt zz zb： evil nomal 模式下，把当前行移动到屏幕顶部、总部、底部。
;; H  L:evil nomal 模式下，把光标移动到屏幕顶部， 底部。 gg是移动到到第一行， G是移动到最后一行。
;;
;; 在evil normal模式  *  自动匹配光标下的单词，高亮显示， 可用n匹配下项。
;; / 绑定到evil-ex-search-forward：  用于需要手动输入的时候。
;;
;; 调整缩进、格式 C-M-\
;; 进入 VISUAL模式， 按i  再按 （ ‘ “ 。。。 就会自动选中被这些符号包围的内容。
;; 在正常、可视、插入模式下, M-; 在行尾添加注释。s-/  是对整行或选中区域进行注释或取消注释。
;; M-↑ 把当前行上移一行； M-↓ 把当前行下移一行
;;
;; org显示内嵌的图片:  z i
;;
;;
;; =============================================================================


;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 16))

;; (setq doom-font (font-spec :family "Ubuntu Mono" :size 20)) ;; Ubuntu Mono英文字体宽度，是中文字体宽度的一半， 可以保证org表格中英文对齐，字体大小要设成偶数才能对齐，如16， 18.。。https://design.ubuntu.com/font/
(setq doom-font (font-spec :family "JetBrains Mono" :size 18))  ;; 使用JetBrains Mono字体: https://www.jetbrains.com/lp/mono/
;; (setq doom-font (font-spec :family "Fira Code" :size 15))  ;; 使用Fira Code字体: brew tap caskroom/fonts  brew cask install font-fira-code
;; (setq doom-font (font-spec :family "Source Code Pro" :size 15))  ;; 使用Source Code Pro 字体  https://github.com/adobe-fonts/source-code-pro


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.




;; ================================================================================
;; ================================================================================
;; ================================================================================

;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; ;; Place your private configuration here
;; ;; ======= 显示 display  =========================================================
;; ;;
;; (use-package monokai-theme              ;; 使用 monokai 主题。 要在packages.el中安装  monokai-theme
;;   :config
;;   (setq doom-theme 'monokai
;;         monokai-highlight-line "black"    ; 修改monokai当前行的高亮背景色
;;         ))

;; 给org-mode单独设置字体, 稍大一点 参考：  https://pumpkinblog.top/post/org_set_fonts/  https://manateelazycat.github.io/emacs/2020/04/02/org-font.html
;; 使用Ubuntu Mono它的英文字体宽度，是中文字体宽带的一半， 可以保证org表格中英文对齐，字体大小要设成偶数才能对齐，如16， 18.。。https://design.ubuntu.com/font/
;; (with-eval-after-load 'org
;;   (defun org-buffer-face-mode-variable ()
;;     (interactive)
;;     (make-face 'my-org-face)  ;; 创建一个自己的face
;;     (set-face-attribute 'my-org-face nil  ;; 配置这个face
;;                         :font "Ubuntu Mono 18"  ;; 把org-mode的字体设的稍大一点, 使用Ubuntu Mono，保证org里表格中英文对齐.字体大小要偶数才能对齐，如16， 18.。。
;;                         ;; 设置中文字体，如果不需设置中文字体可以去掉这一行
;;                         ;; :fontset (create-fontset-from-fontset-spec (concat "-*-*-*-*-*--*-*-*-*-*-*-fontset-org" ",han:翩翩体-简"))
;;                         )
;;     (setq buffer-face-mode-face 'my-org-face) ;; 指定buffer-face的face为自己定义的那个face
;;     (buffer-face-mode))
;;   (add-hook 'org-mode-hook 'org-buffer-face-mode-variable))   ;; org-mode-hook 这个 function


(setq initial-frame-alist (quote ((fullscreen . fullscreen))))   ;; 默认全屏充满
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))   ;; 默认全屏
(setq evil-visual-state-cursor 'hbar)  ;; 默认是 hollow空心块， 会造成在手动选中高亮时，最后一个字符看不见，这里改成 hbar下划线。


;; ;; 可通过 M-x list-faces-display 来查看和显示有关的配置信息。
(custom-set-faces
 ;; '(org-table ((t (:foreground "#6c71c4" :family "Ubuntu Mono")))) ; 解决org-table中英混排对齐, org-table 自己单独使用一个字体：Ubuntu Mono是英文是中文半宽长度的字体 https://design.ubuntu.com/font/ 中文字体宽度是英文的2倍。 上面Fira Code字体大小也要设成14或16大小。不然也对不齐

 '(hl-line ((t (:background "#0D343E" )))) ;; 修改当前行的高亮背景色。 M-x 运行describe-char -> Face: h1-line -> Background: #0D343E 可以看到这个值。通过(customize this face) 修改，被保存在 ~/.emacs.d/.local/custom.el 文件
 ;; '(font-lock-comment-face ((t (:foreground "#75715E"))))                 ;; 修改doom-molokai 注释行字体的前景色。 默认的感觉淡了点。
 ;; '(default ((t (:background "#0B2B2D"))))   ;; 把背景色改成 jonathan blow 使用的绿色背景: #0B2B2D

 ;; z a 折叠开关  z m 全部折叠  z r 展开所有折叠  z o 展开当前所在的折叠
 '(+fold-hideshow-folded-face ((t (:inherit font-lock-comment-face :background "#3A4625" :foreground "red" :weight semi-light)))) ; 设置折叠的背景色
 '(vimish-fold-overlay ((t (:inherit font-lock-comment-face :background "#3A4625" :foreground "red" :weight bold))))  ; 设置折叠的背景色

 ;;  '(solaire-default-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-fringe-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-hl-line-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-line-number-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-minibuffer-face ((t (:background "#0B2B2D"))))
 ;; '(solaire-mode-line-face ((t (:background "#0B2B2D"))))
 ;; '(solaire-mode-line-inactive-face ((t (:background "#0B2B2D"))))
 ;;  '(solaire-org-hide-face ((t (:background "#0B2B2D"))))

 ;; 设置org标题1-8级的字体大小和颜色，颜色摘抄自monokai。;希望org-mode标题的字体大小和正文一致，设成1.0， 如果希望标题字体大一点可以设成1.2
 ;; '(org-level-1 ((t (:inherit outline-1 :height 1.2  :foreground "#FD971F")))) ; monokai-orange "#FD971F"
 ;; '(org-level-2 ((t (:inherit outline-2 :height 1.2  :foreground "#A6E22E")))) ; monokai-green "#A6E22E"
 ;; '(org-level-3 ((t (:inherit outline-3 :height 1.2  :foreground "#66D9EF")))) ; monokai-blue "#66D9EF"
 ;; '(org-level-4 ((t (:inherit outline-4 :height 1.2  :foreground "#E6DB74")))) ; monokai-yellow "#E6DB74"
 ;; '(org-level-5 ((t (:inherit outline-5 :height 1.2  :foreground "#A1EFE4")))) ; monokai-cyan "#A1EFE4"
 ;; '(org-level-6 ((t (:inherit outline-6 :height 1.2  :foreground "#A6E22E")))) ; monokai-green "#A6E22E"
 ;; '(org-level-7 ((t (:inherit outline-7 :height 1.2  :foreground "#F92672")))) ; monokai-red "#F92672"
 ;; '(org-level-8 ((t (:inherit outline-8 :height 1.2  :foreground "#66D9EF")))) ; monokai-blue "#66D9EF"
 ;; 调整org标题字体大小， 颜色不变。
 '(org-level-1 ((t (:inherit outline-1 :height 1.1  )))) ; monokai-orange "#FD971F"
 '(org-level-2 ((t (:inherit outline-2 :height 1.1  )))) ; monokai-green "#A6E22E"
 '(org-level-3 ((t (:inherit outline-3 :height 1.1  )))) ; monokai-blue "#66D9EF"
 '(org-level-4 ((t (:inherit outline-4 :height 1.1  )))) ; monokai-yellow "#E6DB74"
 '(org-level-5 ((t (:inherit outline-5 :height 1.1  )))) ; monokai-cyan "#A1EFE4"
 '(org-level-6 ((t (:inherit outline-6 :height 1.1  )))) ; monokai-green "#A6E22E"
 '(org-level-7 ((t (:inherit outline-7 :height 1.1  )))) ; monokai-red "#F92672"
 '(org-level-8 ((t (:inherit outline-8 :height 1.1  )))) ; monokai-blue "#66D9EF"



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

(use-package smart-input-source    ; 原生输入法切换: 汉字后面跟空格触发 inline english 区域; 光标离开区域，或者回车，关闭 inline english 区域。
  :config
  (setq smart-input-source-english-input-source
        "com.apple.keylayout.US") 
  (setq smart-input-source-other-input-source
        "com.sogou.inputmethod.sogou.pinyin")
  (add-hook 'text-mode-hook #'smart-input-source-mode)
  (add-hook 'prog-mode-hook #'smart-input-source-mode))


(use-package! valign    ; valign可以让Org Mode表格像素对齐，变宽字体也可以对齐。https://github.com/casouri/valign
  :init
  (require 'valign)
  :hook
  ('org-mode . #'valign-mode))


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
(remove-hook 'org-mode-hook #'auto-fill-mode) ; 在新的doom 20191017版本中，这个好像不行了，只好用下面这个把 fill-column设一个大值
(setq-default fill-column 1500)               ; org-mode模式，在超过fill-column值的列位置，插入空格，会导致硬换行|硬回车, 烦人，所以这里故意把它设大。

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
 ;; :nvi "C-k" #'kill-line                 ; 在正常、可视、插入模式下, C-k 删除当前行光标后的内容。
 ;; :nvi "C-e" #'doom/forward-to-last-non-comment-or-eol ; 在正常、可视、插入模式下, C-e 去到行尾。
 ;; :nvi "M-;" #'comment-dwim     ; 在正常、可视、插入模式下, M-; 在行尾添加注释。s-/  是对整行或选中区域进行注释或取消注释。
 ;; :nvi "s-/" #'comment-line     ; S代表Shift键盘；s代表Command键，默认s-/绑定到evilnc-comment-or-uncomment-lines， 感觉没comment-line好用
 )



(map! :leader
      (:prefix ("t" . "toggle")                               ;  SPC t 切换 toggle
       ;; :desc "当前行居中"                  "-" #'centered-cursor-mode) ; 切换当前行居中
       ;;         :desc "自动调整窗口大小"     "w" #'golden-ratio-mode; 切换自动调整当前窗口大小
       ;; :desc "自动折行"         "v" #'visual-line-mode    ; 系统提供了word-wrap模块，启用后，可通过 SPC t w 切换。自动折行，虚拟成n行，上下行、头尾移动方便。 toggle-truncate-lines自动折行，但逻辑上还是一行，不好用。
       ;;   ;;; deprecated      ;; :desc "org显示内嵌的图片"       "m" #'org-toggle-inline-images ; 在org-mode下， 这个函数系统已经默认绑定到 z i
       ))
