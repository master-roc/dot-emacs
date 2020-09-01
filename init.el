(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")))
(package-initialize)

;;******************** some global setting********************
;; 状态栏显示行列信息
(column-number-mode t)
;; 自动补全括号
(electric-pair-mode t)
;; 当前行高亮
(global-hl-line-mode t)
;; 侧边显示行号
(global-linum-mode t)
;; 括号匹配高亮
(show-paren-mode t)

;;不显示工具栏
(tool-bar-mode -1)
;;不显示菜单栏
(menu-bar-mode -1)
;;不显示滚动条
(scroll-bar-mode -1)

;; eglot
(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

;; company-mode
(require 'company)
(global-company-mode t)

;; solarized-theme
(require 'solarized-theme)
(load-theme 'solarized-dark t)

(require 'ace-window)
(defun joe-scroll-other-window()
  (interactive)
  (scroll-other-window 1))
(defun joe-scroll-other-window-down ()
  (interactive)
  (scroll-other-window-down 1))

(set-face-attribute
 'aw-leading-char-face nil
 :foreground "deep sky blue"
 :weight 'bold
 :height 3.0)
(set-face-attribute
 'aw-mode-line-face nil
 :inherit 'mode-line-buffer-id
 :foreground "lawn green")
(setq aw-keys '(?a ?s ?d ?f ?j ?k ?l)
      aw-dispatch-always t
      aw-dispatch-alist
      '((?x aw-delete-window "Ace - Delete Window")
	(?c aw-swap-window "Ace - Swap Window")
	(?n aw-flip-window)
	(?v aw-split-window-vert "Ace - Split Vert Window")
	(?h aw-split-window-horz "Ace - Split Horz Window")
	(?m delete-other-windows "Ace - Maximize Window")
	(?g delete-other-windows)
	(?b balance-windows)
	(?u (lambda ()
	      (progn
		(winner-undo)
		(setq this-command 'winner-undo))))
	(?r winner-redo)))

(when (package-installed-p 'hydra)
  (defhydra hydra-window-size (:color red)
    "Windows size"
    ("h" shrink-window-horizontally "shrink horizontal")
    ("j" shrink-window "shrink vertical")
    ("k" enlarge-window "enlarge vertical")
    ("l" enlarge-window-horizontally "enlarge horizontal"))
  (defhydra hydra-window-frame (:color red)
    "Frame"
    ("f" make-frame "new frame")
    ("x" delete-frame "delete frame"))
  (defhydra hydra-window-scroll (:color red)
    "Scroll other window"
    ("n" joe-scroll-other-window "scroll")
    ("p" joe-scroll-other-window-down "scroll down"))
  (add-to-list 'aw-dispatch-alist '(?w hydra-window-size/body) t)
  (add-to-list 'aw-dispatch-alist '(?o hydra-window-scroll/body) t)
  (add-to-list 'aw-dispatch-alist '(?\; hydra-window-frame/body) t))
(ace-window-display-mode t)

;; global key bind

;; ace-window-mode kbd set
(global-set-key (kbd "M-o") 'ace-window)
;; speedbar kbd set
(global-set-key[f6] 'speedbar);


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(package-selected-packages (quote (solarized-theme ggtags eglot company ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

