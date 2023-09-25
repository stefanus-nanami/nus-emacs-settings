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
   '("9dccdccfeb236623d5c7cf0250a92308cf307afde4ebdaf173b59e8bbbae1828" "8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e" default))
 '(dabbrev-case-replace nil)
 '(display-fill-column-indicator-column 100)
 '(display-line-numbers-major-tick 50)
 '(display-line-numbers-minor-tick 10)
 '(display-line-numbers-width 5)
 '(doom-themes-enable-italic nil)
 '(dynamic-completion-mode t)
 '(eglot-connect-timeout 180)
 '(eglot-ignored-server-capabilities '(:inlayHintProvider))
 '(eglot-prefer-plaintext t)
 '(electric-pair-mode t)
 '(epa-file-cache-passphrase-for-symmetric-encryption t)
 '(exec-path-from-shell-arguments nil)
 '(global-display-fill-column-indicator-mode t)
 '(global-hl-line-mode t)
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
   '(eldoc-box ag yasnippet-snippets ucs-utils tree-sitter-langs swift-mode objc-font-lock magit lua-mode json-mode ivy helm-xref helm-tree-sitter helm-projectile helm-ls-git helm-company helm-ag glsl-mode font-utils flycheck exec-path-from-shell emojify doom-themes doom-modeline company-dict cmake-font-lock atom-one-dark-theme all-the-icons-dired))
 '(recentf-auto-cleanup 300)
 '(recentf-mode t)
 '(scroll-bar-mode nil)
 '(sentence-end-base "[.?!…‽;:{][]\"'”’)}»›]*")
 '(smtpmail-default-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(swift-mode:basic-offset 2)
 '(truncate-lines t)
 '(warning-suppress-types '((emacs)))
 '(whitespace-display-mappings
   '((space-mark 32
                 [183]
                 [46])
     (space-mark 160
                 [164]
                 [95])
     (newline-mark 10
                   [8626 10])
     (tab-mark 9
               [187 9]
               [92 9])))
 '(whitespace-style
   '(face trailing tabs newline missing-newline-at-eof empty tab-mark newline-mark)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column-indicator ((t (:stipple nil :foreground "midnight blue" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight thin))))
 '(font-lock-builtin-face ((t (:foreground "DeepSkyBlue3"))))
 '(font-lock-comment-face ((t (:foreground "DimGrey"))))
 '(font-lock-doc-face ((t (:foreground "slate gray" :inherit font-lock-comment-face))))
 '(highlight ((t (:background "#808000" :foreground "#2e3436"))))
 '(hl-line ((t (:extend t :background "#202040"))))
 '(line-number ((t (:inherit default :foreground "PaleVioletRed4" :slant italic))))
 '(line-number-current-line ((t (:inherit line-number :foreground "gainsboro" :weight bold))))
 '(line-number-major-tick ((t (:inherit line-number :foreground "PaleVioletRed1" :weight bold))))
 '(line-number-minor-tick ((t (:inherit line-number :foreground "PaleVioletRed3"))))
 '(mode-line ((t (:background "dark slate blue" :box nil))))
 '(mode-line-inactive ((t (:background "dark slate blue" :foreground "light slate blue" :box nil))))
 '(region ((t (:extend t :background "#4d377b"))))
 '(tree-sitter-hl-face:function.call ((t (:inherit font-lock-function-call-face))))
 '(tree-sitter-hl-face:operator ((t (:inherit default))))
 '(tree-sitter-hl-face:property ((t (:weight bold :inherit font-lock-property-use-face))))
 '(tree-sitter-hl-face:property.definition ((t (:inherit font-lock-property-name-face))))
 '(tree-sitter-hl-face:punctuation ((t (:inherit font-lock-bracket-face))))
 '(tree-sitter-hl-face:punctuation.special ((t (:inherit font-lock-misc-punctuation-face))))
 '(whitespace-newline ((t (:foreground "gray24"))))
 '(whitespace-space ((t (:inherit whitespace-newline))))
 '(whitespace-tab ((t (:inherit whitespace-newline))))
 '(whitespace-trailing ((t (:foreground "OrangeRed2" :background "firebrick")))))

(setq load-prefer-newer t)

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

(use-package emojify
  :ensure t)

(use-package eldoc-box
  :ensure t
  :bind (("C-h C-SPC" . 'eldoc-box-help-at-point))
  :init
  (setq eldoc-box-clear-with-C-g t))

(use-package company-dict
  :ensure t)

(use-package company
  :ensure t
  :requires company-dict
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
  (global-company-mode t))

(use-package helm-company
  :ensure t)

(use-package helm-ag
  :ensure t)

(use-package helm
  :ensure t
  :requires (helm-company helm-ag)
  :init
  (setq helm-ag-insert-at-point 'symbol
        helm-ag-use-agignore 1
        helm-buffer-max-length 40
        helm-command-prefix-key "C-c h"
        helm-commands-using-frame '(completion-at-point helm-company)
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
          "\\`\\*company"
          "\\`\\*Compile-Log"
          "\\`\\*Customize"
          "\\`\\*Async-native-compile-log"
          "\\`\\*Packages"
          "\\`\\*Warnings"
          "\\`\\*Colors"
          "\\`\\*EGLOT"
          "\\`\\*pylsp"
          "\\`\\*clang"
          "\\`\\*tree-sitter"
          "\\`\\*csharp-ls"
          "\\`\\*json-ls"
          "\\`\\*sourcekit-ls"
          "\\`\\*projectile"
          "\\`\\*ag"
          "\\`\\*eldoc"))
  (setq helm-source-names-using-follow '("Helm Xref"))
  (setq helm-white-buffer-regexp-list '("\\`\\*helm ag results"))

  :bind (("C-c g" . helm-do-ag)
         ("C-c b" . helm-do-ag-buffers)
         ("<f2>" . helm-mini)
         ("<f8>" . helm-browse-project)
         ("<f5>" . helm-tree-sitter-or-imenu)
         ("C-<f5>" . helm-imenu-in-all-buffers)
         ("<f6>" . helm-show-kill-ring)
         ("C-<f6>" . helm-all-mark-rings)
         ("M-s g" . helm-occur-visible-buffers))

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
  (projectile-mode 1))

(use-package helm-projectile
  :ensure t
  :requires projectile
  :bind (("<f9>" . helm-projectile-find-other-file)
         ("C-<f9>" . helm-projectile)
         ("M-<f9>" . helm-projects-find-files))
  :config
  (helm-projectile-on))

(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t)

(use-package helm-tree-sitter
  :ensure t
  :requires tree-sitter)

(use-package helm-xref
  :ensure t)

(use-package helm-ls-git
  :ensure t)

(use-package cmake-mode
  :ensure t)

(use-package cmake-font-lock
  :ensure t
  :requires cmake-mode)

(use-package magit
  :ensure t
  :init
  :bind (("C-c m s" . magit-status)
         ("C-c m d" . magit-dispatch)
         ("C-c m f" . magit-file-dispatch)))

(use-package objc-font-lock
  :ensure t)

(use-package doom-themes
  :ensure t)

(use-package doom-modeline
  :ensure t)

(use-package lua-mode
  :ensure t)

(use-package atom-one-dark-theme
  :ensure t)

(use-package swift-mode
  :ensure t)

(use-package glsl-mode
  :ensure t)

(use-package json-mode
  :ensure t)

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
(bind-key "C-c d" (lambda (&optional arg)
                    "Kill word(s) at point."
                    (interactive "^p")
                    (backward-word (or arg 1))
                    (kill-word (or arg 1))))

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

(bind-key "C-c k" 'kill-this-buffer)

(unbind-key "C-M-<backspace>")
(unbind-key "C-M-<delete>")
(bind-key "C-<backspace>" 'backward-kill-sexp)

(bind-key "C-c l" 'duplicate-dwim)

(bind-key "M-f" 'forward-to-word)
(bind-key "M-b" 'backward-to-word)
(bind-key "M-F" 'forward-word)
(bind-key "M-B" 'backward-word)

;; Binding LSP related keys.
(bind-keys ("<f12>" . xref-find-definitions)
           ("C-<f12>" . xref-find-references))

(bind-keys ([remap find-file] . helm-find-files)
           ([remap execute-extended-command] . helm-M-x)
           ([remap occur] . helm-occur)
           ([remap list-buffers] . helm-buffers-list)
           ([remap apropos-command] . helm-apropos))

(unbind-key "C-c C-c" c-mode-map)
(unbind-key "C-c C-c" c++-mode-map)
(unbind-key "C-c C-c" python-mode-map)
(bind-key "C-c C-c" 'comment-or-uncomment-region)

(bind-keys :map projectile-mode-map
           ("C-c p" . projectile-command-map))

;; Completions.
(bind-key [remap complete] 'helm-company)

;; Replace
(bind-keys ("C-c r s" . replace-string)
           ("C-c r r" . replace-regexp)
           ("C-c r q" . query-replace-regexp)
           ("C-c r p" . project-query-replace-regexp))

(cond ((string= system-type "windows-nt")
       (setq w32-pass-lwindow-to-system nil)
       (setq w32-lwindow-modifier 'super)
       (setq w32-pass-rwindow-to-system nil)
       (setq w32-rwindow-modifier 'super)
       (setq find-program "C:\\cygwin64\\bin\\find.exe"))
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
       (bind-key "<f22>" 'scroll-lock-mode)
       (bind-key "s-<f9>" 'fw-ops-swap-buffers)))

;; Map extensions to modes.
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

;; No treesit for now...
(cond ((string= system-type "windows-nt")
       (add-to-list 'auto-mode-alist
                    '("\\(\\.ii\\|\\.\\(CC?\\|HH?\\)\\|\\.[ch]\\(pp\\|xx\\|\\+\\+\\)\\|\\.\\(cc\\|hh\\)\\)\\'" . c++-mode))
       (add-to-list 'auto-mode-alist '("\\.h\\'" . c-or-c++-mode))
       (add-to-list 'auto-mode-alist
                    '("\\(\\.[ci]\\|\\.lex\\|\\.y\\(acc\\)?\\)\\'" . c-mode))
       (add-to-list 'auto-mode-alist '("\\.x[pb]m\\'" . c-mode)))
      (t
       (add-to-list 'major-mode-remap-alist '(csharp-mode . csharp-ts-mode))
       (add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
       (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))))

(setq-default c-ts-mode-indent-style 'bsd)

(cond ((string= localhost-name "Lyka")
       (setq-default tab-width 2)
       (setq-default indent-tabs-mode nil)
       (setq-default c-basic-offset 2)
       (setq-default c-ts-mode-indent-offset 2))
      (t
       (setq-default tab-width 4)
       (setq-default indent-tabs-mode t)
       (setq-default c-basic-offset 4)
       (setq-default c-ts-mode-indent-offset 4)))

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

(setq c-auto-align-backslashes nil)

;; Python.
(setq-default python-indent-offset 4)

;; Hooks

(add-hook 'prog-mode-hook
          (lambda ()
            (whitespace-toggle-options 'trailing)
            (display-line-numbers-mode)))

(add-hook 'js-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)))

(add-hook 'csharp-ts-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

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

(add-hook 'eldoc-mode-hook
          (lambda ()
            (eldoc-box-hover-mode -1)))

(add-hook 'c++-ts-mode-hook
          (lambda ()
            (setq-local current-indent-rules
                        (alist-get 'cpp treesit-simple-indent-rules))
            (add-to-list 'current-indent-rules '((node-is "case_statement") parent-bol 0))
            (add-to-list 'current-indent-rules '((parent-is "case_statement") parent-bol c-ts-mode-indent-offset))
            (add-to-list 'current-indent-rules '((parent-is "else_clause") parent-bol 0))
            (add-to-list 'current-indent-rules '((node-is "preproc_arg") column-0 0))
            (setf (alist-get 'cpp treesit-simple-indent-rules) current-indent-rules)))

;; EGLOT hooks.
(add-hook 'c-mode-hook
          (lambda ()
            (cond ((eq major-mode 'hlsl-mode))
                  (t
                   (eglot-ensure)))))
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'objc-mode-hook 'eglot-ensure)
(add-hook 'swift-mode-hook 'eglot-ensure)
(add-hook 'csharp-mode-hook 'eglot-ensure)
(add-hook 'csharp-ts-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)
(add-hook 'lua-mode-hook 'eglot-ensure)
(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (flymake-mode -1)))

(add-hook 'eldoc-box-buffer-hook
          (lambda ()
            (add-to-list 'default-frame-alist '(alpha . (95 . 95)))))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `((csharp-mode csharp-ts-mode) . ("OmniSharp" "--languageserver")))
  (add-to-list 'eglot-server-programs
               `((c-mode c++-mode c-ts-mode c++ts-mode) . ("clangd"
                                                           "-j=8"
                                                           "--log=error"
                                                           "--background-index"
                                                           "--clang-tidy"
                                                           "--completion-style=detailed"
                                                           "--pch-storage=memory"
                                                           "--header-insertion=never"
                                                           "--header-insertion-decorators=0")))
  (add-to-list 'eglot-server-programs
               `((python-mode python-ts-mode) . ("pyright-langserver" "--stdio"))))

(cond ((string= system-type "darwin")
       (with-eval-after-load 'eglot
         (add-to-list 'eglot-server-programs
                      `(swift-mode . ("xcrun" "sourcekit-lsp"))))))

;; Visualize whitespaces.
(global-whitespace-mode)

(global-subword-mode 1)

(winner-mode 1)

(provide 'init)
;;; init.el ends here

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
