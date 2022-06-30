;; Nus' init.el

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(backup-directory-alist '(("" . "~/.emacs.d/backups")))
 '(c-basic-offset 4)
 '(c-hanging-braces-alist
   '((block-close . c-snug-do-while)
     (statement-cont)
     (brace-list-open)
     (brace-entry-open)
     (extern-lang-open after)
     (namespace-open after)
     (module-open after)
     (composition-open after)
     (inexpr-class-open after)
     (inexpr-class-close before)
     (arglist-cont-nonempty)))
 '(c-offsets-alist '((substatement-open . +)))
 '(completion-search-distance 0)
 '(completion-styles '(flex basic partial-completion emacs22))
 '(current-language-environment "Japanese")
 '(custom-enabled-themes '(tango-dark))
 '(display-line-numbers t)
 '(display-line-numbers-major-tick 50)
 '(display-line-numbers-minor-tick 10)
 '(display-line-numbers-width 5)
 '(dynamic-completion-mode t)
 '(global-flycheck-mode t)
 '(global-whitespace-mode t)
 '(global-whitespace-newline-mode t)
 '(helm-ag-base-command "ag --nocolor --nogroup --vimgrep")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-insert-at-point 'symbol)
 '(helm-ag-use-agignore 1)
 '(helm-boring-buffer-regexp-list
   '("\\` " "\\`\\*helm" "\\`\\*Echo Area" "\\`\\*Minibuf" "\\`\\*Customize" "\\`\\*Messages" "\\`\\*info"))
 '(helm-buffer-max-length nil)
 '(helm-dabbrev-cycle-threshold 0)
 '(helm-dabbrev-ignored-buffers-regexps
   '("\\*helm" "\\*Messages" "\\*Echo Area" "\\*Buffer List" "\\*Customize \\*"))
 '(inhibit-startup-screen t)
 '(package-archives
   '(("melpa-stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages '(glsl-mode json-mode helm-ag helm-ls-git helm bind-key))
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(whitespace-style '(face trailing tabs tab-mark)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:foreground "PaleVioletRed4"))))
 '(line-number-current-line ((t (:inherit line-number :foreground "red"))))
 '(line-number-major-tick ((t (:background "gray17" :foreground "white"))))
 '(line-number-minor-tick ((t (:foreground "white"))))
 '(whitespace-empty ((t (:foreground "firebrick"))))
 '(whitespace-tab ((t (:foreground "gray36")))))

;; Activate all the packages.
(package-initialize)

;; Fetch the list of packages available.
(unless package-archive-contents
  (package-refresh-contents))

;; Install the missing packages
(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (package-install package)))

(setq load-path (cons "~/.emacs.d/local" load-path))

(autoload 'hlsl-mode "hlsl-mode" nil t)

(require 'bind-key)

(require 'helm)
(require 'helm-config)
(helm-mode 1)
(setq helm-dabbrev-separator-regexp
      "\\s-\\|\t\\|[(\\[\\{}\"'`=<>$;:,@.#\\*\\/\\+-&~%\\(\\)\\?+]\\|\\s\\\\|^\n\\|^")

(require 'helm-ls-git)

(require 'helm-ag)

(require 'json-mode)

(require 'nus)

(require 'wnd-pos)

;; Set editor default behavior.
(setq frame-title-format '("" "%f @ Emacs " emacs-version))

;; Bind keys.
(unbind-key "C-\\" isearch-mode-map)
(bind-key* "C-\\" 'undo)
(bind-key "C-<f12>" 'other-window)
(bind-key "C-z" nil)
(bind-key "C-;" 'complete)
(bind-key "C-'" 'helm-dabbrev)
(bind-key "M-x" 'helm-M-x)
(bind-key "C-x C-f" 'helm-find-files)
(bind-key "C-c g" 'helm-do-ag)
(bind-key "C-c b" 'helm-do-ag-buffers)
(bind-key "<f2>" 'helm-buffers-list)

;; Map extensions to modes.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fx\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.hlsl\\'" . hlsl-mode))

(center-frame-on-screen (selected-frame))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

