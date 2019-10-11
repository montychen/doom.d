;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! monokai-theme :recipe (:host github :repo "oneKelvinSmith/monokai-emacs"))
(package! centered-cursor-mode)         ; 光标垂直居中
;; (package! golden-ratio)         ; 选中的窗口自动黄金分割大小。

(package! pangu-spacing :disable t)     ;在org，doom默认配置了在中英文间插入空格。我不想插入空格，禁用pangu-spacing包。
