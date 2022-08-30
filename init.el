;;; init.el --- init elisp script. -*- no-byte-compile: t -*-
;;; Commentary:
;;; My initialization script.

;;; Code:
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
 '(c-mode-common-hook '(lsp))
 '(c-offsets-alist '((substatement-open . 0)))
 '(completion-search-distance 0)
 '(completion-styles '(flex basic partial-completion emacs22))
 '(current-language-environment "Japanese")
 '(custom-enabled-themes '(tango-dark))
 '(custom-safe-themes
   '("ed68393e901a88b9feefea1abfa9a9c5983e166e4378c71bb92e636423bd94fd" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(display-line-numbers t)
 '(display-line-numbers-major-tick 50)
 '(display-line-numbers-minor-tick 10)
 '(display-line-numbers-width 5)
 '(dynamic-completion-mode t)
 '(electric-pair-mode t)
 '(global-flycheck-mode t)
 '(global-whitespace-mode t)
 '(global-whitespace-newline-mode t)
 '(helm-ag-insert-at-point 'symbol)
 '(helm-ag-use-agignore 1)
 '(helm-boring-buffer-regexp-list
   '("\\` " "\\`\\*helm" "\\`\\*Echo Area" "\\`\\*Minibuf" "\\`\\*lsp" "\\`\\*clangd" "\\`\\*Flymake" "\\`\\*gcc"))
 '(helm-buffer-max-length nil)
 '(helm-dabbrev-cycle-threshold 0)
 '(helm-dabbrev-ignored-buffers-regexps
   '("\\*helm" "\\*Messages" "\\*Echo Area" "\\*Buffer List" "\\*lsp" "\\*clangd" "\\*Flymake" "\\*gcc"))
 '(helm-dabbrev-separator-regexp "\\s-\\|[(\\[\\{\"'`=<>$:;,@.#+]\\|\\s\\\\|^\\|^" t)
 '(inhibit-startup-screen t)
 '(lsp-enable-indentation nil)
 '(lsp-enable-on-type-formatting nil)
 '(lsp-enable-snippet nil)
 '(lsp-headerline-breadcrumb-enable t)
 '(lsp-headerline-breadcrumb-enable-diagnostics nil)
 '(lsp-keymap-prefix "C-c l")
 '(package-archives
   '(("melpa-stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(all-the-icons doom-modeline helm-descbinds lua-mode exec-path-from-shell smart-mode-line-atom-one-dark-theme atom-one-dark-theme smart-mode-line swift-mode helm-projectile projectile compat auto-compile flycheck helm-xref helm-lsp lsp-mode function-args csharp-mode glsl-mode json-mode helm-ag helm-ls-git helm bind-key))
 '(projectile-completion-system 'helm)
 '(projectile-globally-ignored-directories
   '("^\\.idea$" "^\\.vscode$" "^\\.ensime_cache$" "^\\.eunit$" "^\\.git$" "^\\.hg$" "^\\.fslckout$" "^_FOSSIL_$" "^\\.bzr$" "^_darcs$" "^\\.pijul$" "^\\.tox$" "^\\.svn$" "^\\.stack-work$" "^\\.ccls-cache$" "^\\.cache$" "^\\.clangd$" "^\\.gitlab$"))
 '(projectile-globally-ignored-file-suffixes
   '(".exe" ".dll" ".pdb" ".lib" ".obj" ".diff" ".o" ".a" ".dylib" ".so"))
 '(projectile-globally-ignored-files '("TAGS" ".git*"))
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(sml/shorten-modes t)
 '(sml/theme 'dark)
 '(truncate-lines t)
 '(warning-suppress-log-types '((comp) (lsp-mode)))
 '(warning-suppress-types '((emacs)))
 '(whitespace-style '(face trailing tabs tab-mark)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "#fce94f" :foreground "black"))))
 '(header-line ((t (:background "#666" :family "Bitstream Vera Sans"))))
 '(highlight ((t (:background "#808000" :foreground "#2e3436"))))
 '(line-number ((t (:foreground "PaleVioletRed4"))))
 '(line-number-current-line ((t (:inherit line-number :foreground "red"))))
 '(line-number-major-tick ((t (:background "gray17" :foreground "white"))))
 '(line-number-minor-tick ((t (:foreground "white"))))
 '(lsp-headerline-breadcrumb-project-prefix-face ((t (:inherit font-lock-string-face))))
 '(lsp-headerline-breadcrumb-symbols-face ((t (:inherit font-lock-doc-face))))
 '(sml/filename ((t (:weight normal :foreground "#eab700" :inherit sml/global))))
 '(sml/global ((t (:foreground "gray50" :inverse-video nil :family "Bitstream Vera Sans"))))
 '(sml/line-number ((t (:inherit sml/modes))))
 '(sml/modified ((t (:foreground "Red" :inherit sml/not-modified))))
 '(whitespace-empty ((t (:foreground "firebrick"))))
 '(whitespace-tab ((t (:foreground "gray36")))))

(setq load-prefer-newer t)

;; Activate all the packages.
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/local")

;; Fetch the list of packages available.
(unless package-archive-contents
  (package-refresh-contents))

;; Install the missing packages
(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; Auto compile everything.
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'doom-modeline)
(doom-modeline-mode 1)

(when (display-graphic-p)
  (require 'all-the-icons))

(require 'hlsl-mode)
(require 'nus-snippets)
(require 'wnd-pos)

(sml/setup)

(require 'bind-key)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'lsp-mode)

(require 'projectile)

(require 'helm)
(require 'helm-config)
(helm-mode 1)

(require 'helm-ls-git)
(require 'helm-ag)
(require 'helm-xref)
(require 'helm-lsp)
(require 'helm-projectile)

(require 'json-mode)

(require 'function-args)
(fa-config-default)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(helm-projectile-on)

;; Set editor default behavior.
(setq frame-title-format '("" "%f @ Emacs " emacs-version))

;; Bind keys.
(unbind-key "C-\\" isearch-mode-map)
(bind-key* "C-\\" 'undo)
(unbind-key "C-z" global-map)
(bind-key "C-;" 'completion-at-point)
(bind-key "C-'" 'helm-dabbrev)
(bind-key "C-c g" 'helm-do-ag)
(bind-key "C-c b" 'helm-do-ag-buffers)
(bind-key "<f2>" 'helm-mini)
(bind-key "C-x x x" 'save-buffers-kill-emacs)
(bind-key "C-|" 'undo-redo)
(bind-key (concat lsp-keymap-prefix " g p") 'lsp-clangd-find-other-file)
(bind-keys :map lsp-mode-map
           ([remap xref-find-apropos] . helm-lsp-workspace-symbol))
(bind-keys :map global-map
           ([remap find-file] . helm-find-files)
           ([remap execute-extended-command] . helm-M-x))
(unbind-key "C-c C-c" c++-mode-map)
(bind-key "C-c C-c" 'comment-or-uncomment-region)

(cond ((string= system-type "darwin")
       (bind-key "M-," 'customize)))

;; Map extensions to modes.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fx\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.hlsl\\'" . hlsl-mode))

(cond ((string= localhost-name "Lyka")
       (setq-default tab-width 2)
       (setq-default indent-tabs-mode nil))
      (t
       (setq-default tab-width 4)
       (setq-default indent-tabs-mode t)))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

