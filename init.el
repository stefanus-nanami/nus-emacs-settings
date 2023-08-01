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
 '(auto-hscroll-mode 'current-line)
 '(backup-directory-alist '(("" . "~/.emacs.d/backups")))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(completion-search-distance nil)
 '(completion-styles '(helm basic partial-completion emacs22))
 '(current-language-environment "Japanese")
 '(custom-enabled-themes '(doom-outrun-electric))
 '(custom-safe-themes
   '("8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e" default))
 '(display-fill-column-indicator-column 100)
 '(display-line-numbers-major-tick 50)
 '(display-line-numbers-minor-tick 10)
 '(display-line-numbers-width 5)
 '(doom-themes-enable-italic nil)
 '(dynamic-completion-mode t)
 '(electric-pair-mode t)
 '(epa-file-cache-passphrase-for-symmetric-encryption t)
 '(exec-path-from-shell-arguments nil)
 '(global-display-fill-column-indicator-mode t)
 '(global-hl-line-mode t)
 '(global-whitespace-mode t)
 '(global-whitespace-newline-mode t)
 '(gnus-inhibit-startup-message t)
 '(gnus-thread-sort-functions
   '(gnus-thread-sort-by-most-recent-date
     (not gnus-thread-sort-by-number)))
 '(gnus-use-cache t)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(lua-indent-level 2)
 '(max-lisp-eval-depth 65536)
 '(message-send-mail-function 'smtpmail-send-it)
 '(mm-text-html-renderer 'w3m)
 '(package-archives
   '(("melpa-stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(helm-xref treesit-auto emojify cmake-font-lock cmake-mode company-dict helm-company objc-font-lock lsp-sourcekit all-the-icons-dired lsp-ui magit doom-themes all-the-icons doom-modeline lua-mode exec-path-from-shell atom-one-dark-theme swift-mode helm-projectile projectile helm-lsp lsp-mode csharp-mode glsl-mode json-mode helm-ag helm-ls-git helm bind-key))
 '(recentf-auto-cleanup 300)
 '(recentf-mode t)
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(smtpmail-default-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(swift-mode:basic-offset 2)
 '(truncate-lines t)
 '(warning-suppress-log-types '((comp) (lsp-mode)))
 '(warning-suppress-types '((emacs)))
 '(whitespace-style '(face trailing tabs tab-mark)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column-indicator ((t (:stipple nil :foreground "midnight blue" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight thin))))
 '(font-lock-comment-face ((t (:foreground "DeepSkyBlue4"))))
 '(highlight ((t (:background "#808000" :foreground "#2e3436"))))
 '(hl-line ((t (:extend t :background "#202040"))))
 '(line-number ((t (:inherit default :foreground "PaleVioletRed4" :slant italic))))
 '(line-number-current-line ((t (:inherit line-number :foreground "gainsboro" :weight bold))))
 '(line-number-major-tick ((t (:inherit line-number :foreground "PaleVioletRed1" :weight bold))))
 '(line-number-minor-tick ((t (:inherit line-number :foreground "PaleVioletRed3"))))
 '(mode-line ((t (:background "dark slate blue" :box nil))))
 '(mode-line-inactive ((t (:background "dark slate blue" :foreground "light slate blue" :box nil))))
 '(region ((t (:extend t :background "#4d377b"))))
 '(whitespace-empty ((t (:foreground "firebrick"))))
 '(whitespace-tab ((t (:foreground "gray24")))))

(setq load-prefer-newer t)

(defconst use-eglot t "Use eglot instead of LSP mode.")

;; Activate all the packages.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/local")
(add-to-list 'load-path "~/.emacs.d/emacs-w3m")

;; Fetch the list of packages available.
(unless package-archive-contents
  (package-refresh-contents))

;; Install the missing packages
(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (package-install package)))

(use-package bind-key
  :ensure t)

(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize)))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode 1))

(when (display-graphic-p)
  (use-package all-the-icons
    :ensure t)
  (use-package all-the-icons-dired
    :ensure t
    :requires all-the-icons
    :hook dired-mode))

(require 'hlsl-mode)
(require 'nus-snippets)
(require 'fw-ops)

(cond ((string= system-type "windows-nt")
       ;; Cannot use tree sitter for Windows.
       (setq can-use-tree-sitter nil))
      ((>= emacs-major-version 29)
       (setq can-use-tree-sitter t))
      (t
       (setq can-use-tree-sitter nil)))

(if can-use-tree-sitter
    (use-package treesit-auto
      :ensure t
      :config
      (setq treesit-auto-install t)
      (global-treesit-auto-mode)))

(use-package emojify
  :ensure t)

(use-package company
  :ensure t
  :init
  (setq company-backends
        '(company-capf
          company-cmake
          (company-dabbrev-code company-keywords)
          (company-dabbrev company-dict))
        company-idle-delay nil
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil)
  :config
  (global-company-mode t)
)

(cond ((eq use-eglot nil)
       (use-package lsp-mode
         :ensure t
         :init
         (setq lsp-eldoc-enable-hover nil
               lsp-enable-file-watchers nil
               lsp-enable-indentation nil
               lsp-enable-on-type-formatting nil
               lsp-enable-snippet nil
               lsp-headerline-breadcrumb-enable nil
               lsp-keymap-prefix "C-c l"
               lsp-lens-enable nil
               lsp-modeline-diagnostics-enable nil
               lsp-signature-auto-activate nil
               lsp-ui-doc-enable nil
               lsp-ui-sideline-show-diagnostics nil
               lsp-warn-no-matched-clients nil
               lsp-clients-clangd-args '("--header-insertion=never")))))

(use-package helm
  :ensure t
  :init
  (setq helm-ag-insert-at-point 'symbol
        helm-ag-use-agignore 1
        helm-buffer-max-length 40
        helm-command-prefix-key "C-c h"
        helm-commands-using-frame '(completion-at-point helm-company)
        helm-dabbrev-cycle-threshold 0
        helm-dabbrev-separator-regexp "\\s-\\|[(\\[\\{\"'`=<>$:;,@.#+]\\|\\s\\\\|^\\|^"
        helm-ff-file-name-history-use-recentf t
        helm-recentf-fuzzy-match t
        helm-display-header-line nil)
  (setq helm-boring-buffer-regexp-list
        '("\\` "
          "\\`\\*helm"
          "\\`\\*Echo Area"
          "\\`\\*Minibuf"
          "\\`\\*lsp"
          "\\`\\*clangd"
          "\\`\\*Flymake"
          "\\`\\*gcc"
          "\\`\\*omnisharp"
          "\\`\\*glslls"
          "\\`\\*Compile-Log"
          "\\`\\*Customize"
          "\\`\\*Async-native-compile-log"
          "\\`\\*Packages"
          "\\`\\*Warnings"
          "\\`\\*Colors"
          "\\`\\*EGLOT"
          "\\`\\*pylsp"
          "\\`\\*clang"
          "\\`\\*csharp-ls"
          "\\`\\*json-ls"
          "\\`\\*sourcekit-ls"))
  (setq helm-dabbrev-ignored-buffers-regexps
        '("\\*helm"
          "\\*Messages"
          "\\*Echo Area"
          "\\*Buffer List"
          "\\*lsp"
          "\\*clangd"
          "\\*Flymake"
          "\\*gcc"
          "\\*omnisharp"
          "\\*glslls"
          "\\*Compile-Log"
          "\\*Customize"
          "\\*Async-native-compile-log"
          "\\*Packages"
          "\\*Warnings"
          "\\*Colors"
          "\\*EGLOT"
          "\\*pylsp"
          "\\*clang"
          "\\*csharp-ls"
          "\\*json-ls"
          "\\*sourcekit-ls"))
  (setq helm-source-names-using-follow '("Helm Xref"))
  (setq helm-white-buffer-regexp-list '("\\`\\*helm ag results"))
  :config
  (helm-mode 1))

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'helm)
  (setq projectile-globally-ignored-directories
        '("^\\.idea$"
          "^\\.vscode$"
          "^\\.ensime_cache$"
          "^\\.eunit$"
          "^\\.git$"
          "^\\.hg$"
          "^\\.fslckout$"
          "^_FOSSIL_$"
          "^\\.bzr$"
          "^_darcs$"
          "^\\.pijul$"
          "^\\.tox$"
          "^\\.svn$"
          "^\\.stack-work$"
          "^\\.ccls-cache$"
          "^\\.cache$"
          "^\\.clangd$"
          "^\\.gitlab$"))
  (setq projectile-globally-ignored-file-suffixes
        '(".exe"
          ".dll"
          ".pdb"
          ".lib"
          ".obj"
          ".diff"
          ".o"
          ".a"
          ".dylib"
          ".so"))
  (setq projectile-globally-ignored-files
        '("TAGS"
          ".git*"))
  :config
  (projectile-mode +1))

(use-package helm-projectile
  :ensure t
  :requires projectile
  :config
  (helm-projectile-on))

(when (executable-find "w3m")
  (require 'w3m-load))

;; Set editor default behavior.
(setq frame-title-format '("" "%f @ Emacs " emacs-version))

;; Load library for key-binding.
(require 'cc-mode)
(require 'python)

;; Bind keys.
(unbind-key "C-\\" 'isearch-mode-map)
(bind-key* "C-\\" 'undo)
(unbind-key "C-z")
(bind-key "C-x x x" 'save-buffers-kill-emacs)
(bind-key "C-<tab>" 'other-window)

;; Kill word at point.
(bind-key "C-c d" (lambda()
                    (interactive)
                    (backward-word)
                    (kill-word 1)))

;; Pixel scroll everything!
(cond ((>= emacs-major-version 29)
       (setq pixel-scroll-precision-interpolate-page t
             pixel-scroll-precision-interpolation-total-time 0.2
             pixel-scroll-precision-mode t
             pixel-scroll-precision-use-momentum t)
       (pixel-scroll-mode t)
       (bind-key "C-v" 'pixel-scroll-interpolate-down)
       (bind-key "M-v" 'pixel-scroll-interpolate-up)))

;; Undo/redo.
(unbind-key "C-_")
(unbind-key "C-/")
(unbind-key "C-x u")
(unbind-key "C-?")
(unbind-key "C-M-_")
(bind-key "C-|" 'undo-redo)
(bind-key "s-Z" 'undo-redo)

(unbind-key "C-<prior>")
(unbind-key "C-<next>")

(bind-key "M-[" 'scroll-other-window-down)
(bind-key "M-]" 'scroll-other-window)

(unbind-key "M-{")
(unbind-key "M-}")
(bind-key "M-n" 'forward-paragraph)
(bind-key "M-p" 'backward-paragraph)

;; Helm related keys.
(bind-key "C-c g" 'helm-do-ag)
(bind-key "C-c b" 'helm-do-ag-buffers)
(bind-key "<f2>" 'helm-mini)
(bind-key "<f8>" 'helm-browse-project)
(bind-key "<f5>" 'helm-imenu)
(bind-key "C-<f5>" 'helm-imenu-in-all-buffers)
(bind-key "<f6>" 'helm-show-kill-ring)
(bind-key "C-<f6>" 'helm-all-mark-rings)

(cond ((eq use-eglot t)
       (bind-keys ("<f12>" . xref-find-definitions)
                  ("C-<f12>" . xref-find-references)))
      (t
       (bind-keys :map lsp-mode-map
                  ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
                  ([remap xref-find-references] . lsp-ui-peek-find-references)
                  ("<f12>" . lsp-find-definition)
                  ("C-<f12>" . lsp-find-references)
                  ("M-<f12>" . helm-lsp-workspace-symbol)
                  ("s-<f12>" . helm-lsp-global-workspace-symbol))))
(bind-keys :map global-map
           ([remap find-file] . helm-find-files)
           ([remap execute-extended-command] . helm-M-x)
           ([remap occur] . helm-occur)
           ([remap list-buffers] . helm-buffers-list)
           ([remap dabbrev-expand] . helm-dabbrev)
           ([remap apropos-command] . helm-apropos))

(unbind-key "C-c C-c" c-mode-map)
(unbind-key "C-c C-c" c++-mode-map)
(unbind-key "C-c C-c" python-mode-map)
(bind-key "C-c C-c" 'comment-or-uncomment-region)

(bind-keys :map projectile-mode-map
           ("C-c p" . projectile-command-map)
           ("<f9>" . projectile-find-other-file)
           ("C-<f9>" . helm-projectile)
           ("M-<f9>" . helm-projectile-find-file))

;; Completions.
(bind-key "C-;" 'helm-company)
(bind-key "C-'" 'helm-dabbrev)
(bind-key "C-M-'" 'dabbrev-expand)
(unbind-key "M-/")
(unbind-key "C-M-/")

;; Magit
(bind-key "C-c m s" 'magit-status)
(bind-key "C-c m d" 'magit-dispatch)
(bind-key "C-c m f" 'magit-file-dispatch)

;; Replace
(unbind-key "C-M-%")
(bind-keys :map global-map
           ("M-*" . replace-string)
           ("C-*" . replace-regexp)
           ("C-%" . query-replace-regexp))

(cond ((string= system-type "windows-nt")
       (setq w32-pass-lwindow-to-system nil)
       (setq w32-lwindow-modifier 'super)
       (setq w32-pass-rwindow-to-system nil)
       (setq w32-rwindow-modifier 'super))
      ((string= system-type "darwin")
       (setq mac-command-modifier 'meta)
       (setq mac-option-modifier 'super)))

(cond ((string= system-type "darwin")
       (bind-key "M-," 'customize)
       (bind-key "C-s-<f12>" 'scroll-lock-mode)
       (bind-key "s-<up>" 'fw-ops-swap-buffers)
       (bind-key "M-`" 'other-frame)
       (unbind-key "s-`"))
      (t
       (bind-key "s-<f9>" 'fw-ops-swap-buffers)))

;; Map extensions to modes.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.gs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.tese\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.comp\\'" . glsl-mode))

(add-to-list 'auto-mode-alist '("\\.fx\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.hlsl\\'" . hlsl-mode))

(add-to-list 'interpreter-mode-alist '("node" . js-mode))

(cond ((string= localhost-name "Lyka")
       (setq-default tab-width 2)
       (setq-default indent-tabs-mode nil)
       (setq-default c-basic-offset 2))
      (t
       (setq-default tab-width 4)
       (setq-default indent-tabs-mode t)
       (setq-default c-basic-offset 4)))

;; Improving LSP performance.
(cond ((eq use-eglot nil)
       (setq gc-cons-threshold (* 128 1024 1024))
       (setq read-process-output-max (* 1024 1024))))

;; C offsets.
(setq-default c-offsets-alist
              '((brace-list-open . 0)
                (substatement-open . 0)))

(setq-default c-hanging-braces-alist
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

;; Python.
(setq-default python-indent-offset 4)

;; Hooks

(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode)))

(add-hook 'js-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)))

(add-hook 'csharp-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

(add-hook 'lua-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)))

(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq display-fill-column-indicator-column 80)))

(add-hook 'swift-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)))

(add-hook 'cmake-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)))

(add-hook 'markdown-mode-hook
          (lambda ()
            (setq fill-column 100)))

;; LSP hooks.
(cond ((eq use-eglot t)
       (add-hook 'c-mode-hook #'eglot-ensure)
       (add-hook 'c++-mode-hook #'eglot-ensure)
       (add-hook 'objc-mode-hook #'eglot-ensure)
       (add-hook 'swift-mode-hook #'eglot-ensure)
       (add-hook 'csharp-mode-hook #'eglot-ensure)
       (add-hook 'python-mode-hook #'eglot-ensure)
       (add-hook 'js-mode-hook #'eglot-ensure)
       (add-hook 'lua-mode-hook #'eglot-ensure)
       (add-hook 'glsl-mode-hook #'eglot-ensure))
      (t
       (add-hook 'c-mode-hook #'lsp-deferred)
       (add-hook 'c++-mode-hook #'lsp-deferred)
       (add-hook 'objc-mode-hook #'lsp-deferred)
       (add-hook 'swift-mode-hook #'lsp-deferred)
       (add-hook 'csharp-mode-hook #'lsp-deferred)
       (add-hook 'python-mode-hook #'lsp-deferred)
       (add-hook 'js-mode-hook #'lsp-deferred)
       (add-hook 'lua-mode-hook #'lsp-deferred)
       (add-hook 'glsl-mode-hook #'lsp-deferred)))

;; EGLOT hooks.

(if can-use-tree-sitter
    (setq c-ts-mode-hook c-mode-hook
          c++-ts-mode-hook c++-mode-hook
          objc-ts-mode-hook objc-mode-hook
          swift-ts-mode-hook swift-mode-hook
          csharp-ts-mode-hook csharp-mode-hook
          python-ts-mode-hook python-mode-hook
          js-ts-mode-hook js-mode-hook
          lua-ts-mode-hook lua-mode-hook))

(cond ((string= system-type "darwin")
       (eval-after-load 'lsp-mode
         (progn
           (require 'lsp-sourcekit)
           (setq lsp-sourcekit-executable (string-trim (shell-command-to-string
                                                        "xcrun --find sourcekit-lsp")))))
       (with-eval-after-load 'eglot
         (add-to-list 'eglot-server-programs
                      '(swift-mode . ("xcrun" "sourcekit-lsp"))))))

(setq lsp-glsl-executable '("~/.emacs.d/glsl-language-server/build/glslls" "--stdin"))

(provide 'init)
;;; init.el ends here

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

