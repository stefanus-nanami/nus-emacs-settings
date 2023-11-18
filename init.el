;;; init.el --- init elisp script. -*- no-byte-compile: t -*-
;;; Commentary:
;;; My initialization script.

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(jaword markdown-mode ellama helm-descbinds eldoc-box ag yasnippet-snippets ucs-utils tree-sitter-langs swift-mode objc-font-lock magit lua-mode json-mode ivy helm-xref helm-tree-sitter helm-projectile helm-ls-git helm-company helm-ag glsl-mode font-utils flycheck exec-path-from-shell emojify doom-themes doom-modeline company-dict cmake-font-lock atom-one-dark-theme all-the-icons-dired)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column-indicator ((t (:stipple nil :foreground "midnight blue" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight thin))))
 '(font-lock-keyword-face ((t (:foreground "#bb9af7" :weight bold))))
 '(font-lock-type-face ((t (:foreground "#c0caf5" :weight bold))))
 '(highlight ((t (:background "#808000" :foreground "#2e3436"))))
 '(hl-line ((t (:extend t :background "#202040"))))
 '(line-number ((t (:weight normal :slant italic :foreground "PaleVioletRed4" :background "#202040" :inherit default))))
 '(line-number-current-line ((t (:inherit line-number :foreground "gainsboro" :weight bold))))
 '(line-number-major-tick ((t (:inherit line-number :foreground "PaleVioletRed1" :weight bold))))
 '(line-number-minor-tick ((t (:inherit line-number :foreground "PaleVioletRed3"))))
 '(mode-line ((t (:background "RoyalBlue4" :box nil))))
 '(mode-line-inactive ((t (:background "gray20" :foreground "#9099c0" :box nil))))
 '(tree-sitter-hl-face:function.call ((t (:inherit font-lock-function-call-face))))
 '(tree-sitter-hl-face:operator ((t (:inherit default))))
 '(tree-sitter-hl-face:property ((t (:weight bold :inherit font-lock-property-use-face))))
 '(tree-sitter-hl-face:property.definition ((t (:inherit font-lock-property-name-face))))
 '(tree-sitter-hl-face:punctuation ((t (:inherit font-lock-bracket-face))))
 '(tree-sitter-hl-face:punctuation.special ((t (:inherit font-lock-misc-punctuation-face))))
 '(whitespace-missing-newline-at-eof ((t (:inherit whitespace-trailing))))
 '(whitespace-newline ((t (:foreground "gray24"))))
 '(whitespace-space ((t (:inherit whitespace-newline))))
 '(whitespace-tab ((t (:inherit whitespace-newline))))
 '(whitespace-trailing ((t (:foreground "OrangeRed2" :background "firebrick")))))

(setq load-prefer-newer t)

;; Activate all the packages.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/local")
(add-to-list 'load-path "~/.emacs.d/private")
(add-to-list 'load-path "~/.emacs.d/emacs-w3m")

(if (eq (require 'user-profile nil t) nil)
    (message "No user profile available."))

;; Environment.
(setq-default backup-directory-alist '(("" . "~/.emacs.d/backups")))
(setq-default current-language-environment "Japanese")
(setq-default package-archives
              '(("melpa-stable" . "https://stable.melpa.org/packages/")
                ("gnu" . "https://elpa.gnu.org/packages/")
                ("melpa" . "https://melpa.org/packages/")))

;; Completion.
(setq-default dabbrev-case-replace nil)
(dynamic-completion-mode 1)

;; Display.
(setq-default display-fill-column-indicator-column 100)
(setq-default display-line-numbers-major-tick 50)
(setq-default display-line-numbers-minor-tick 10)
(setq-default display-line-numbers-width 5)

;; Eglot.
(setq-default eglot-connect-timeout 300)
(setq-default eglot-events-buffer-size 0)
(setq-default eglot-ignored-server-capabilities '(:inlayHintProvider))
(setq-default eglot-prefer-plaintext t)
(setq-default eglot-sync-connect nil)

;; GNUS
(setq-default gnus-inhibit-startup-message t)
(setq-default gnus-thread-sort-functions '(gnus-thread-sort-by-most-recent-date
                                           (not gnus-thread-sort-by-number)))
(setq-default gnus-use-cache t)

;; History file list.
(setq-default recentf-auto-cleanup 300)
(recentf-mode t)

;; Mail.
(setq-default smtpmail-default-smtp-server "smtp.gmail.com")
(setq-default smtpmail-smtp-service 587)

;; Whitespace.
(setq-default whitespace-display-mappings '((space-mark 32 [183] [46])
                                            (space-mark 160 [164] [95])
                                            (newline-mark 10 [8626 10])
                                            (tab-mark 9 [187 9] [92 9])))
(setq-default whitespace-style '(face
                                 trailing
                                 tabs
                                 newline
                                 missing-newline-at-eof
                                 empty
                                 tab-mark
                                 newline-mark))

;; Miscellaneous variables.
(setq-default ad-redefinition-action 'accept)
(setq-default auto-hscroll-mode 'current-line)
(setq-default blink-cursor-mode nil)
(setq-default epa-file-cache-passphrase-for-symmetric-encryption t)
(setq-default exec-path-from-shell-arguments nil)
(setq-default inhibit-startup-screen t)
(setq-default js-indent-level 2)
(setq-default lua-indent-level 2)
(setq-default max-lisp-eval-depth 65536)
(setq-default message-send-mail-function 'smtpmail-send-it)
(setq-default mm-text-html-renderer 'w3m)
(setq-default truncate-lines t)
(setq-default warning-suppress-types '((emacs comp)))

;; Column number.
(column-number-mode 1)
;; Electric pair
(electric-pair-mode 1)
;; Highlight line.
(global-hl-line-mode 1)

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
  (setq doom-modeline-height 23)
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
        helm-display-header-line nil
        helm-dabbrev-cycle-threshold 0
        helm-dabbrev-separator-regexp "\\s-\\|[(\\[\\{\"'`=<>$:;,@.#+]\\|\\s\\\\|^\\|^")
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
          "\\`\\*Custom"
          "\\`\\*Emoji"
          "\\`\\*Native-compile-Log"
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
          "\\`\\*eldoc"
          "\\`\\*ellama"))
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
          "\\*company"
          "\\*Compile-Log"
          "\\*Customize"
          "\\*Custom"
          "\\*Native-compile-Log"
          "\\*Async-native-compile-log"
          "\\*Packages"
          "\\*Warnings"
          "\\*Colors"
          "\\*EGLOT"
          "\\*pylsp"
          "\\*clang"
          "\\*tree-sitter"
          "\\*csharp-ls"
          "\\*json-ls"
          "\\*sourcekit-ls"
          "\\*projectile"
          "\\*ag"
          "\\*eldoc"
          "\\*ellama"))
  (setq helm-source-names-using-follow '("Helm Xref"))
  (setq helm-white-buffer-regexp-list '("\\`\\*helm ag results"
                                        "\\`\\*ellama\\*$"))
  (add-to-list 'completion-styles 'helm)
  :bind (("C-c g" . helm-do-ag)
         ("C-c b" . helm-do-ag-buffers)
         ("<f2>" . helm-mini)
         ("<f7>" . helm-occur)
         ("<f5>" . helm-tree-sitter-or-imenu)
         ("M-<f5>" . helm-imenu-in-all-buffers)
         ("<f6>" . helm-show-kill-ring)
         ("M-<f6>" . helm-all-mark-rings)
         ("M-s g" . helm-occur-visible-buffers))
  :config
  (helm-mode 1))

(use-package helm-descbinds
  :ensure t
  :bind
  (("M-<f1>" . helm-descbinds))
  :config
  (helm-descbinds-mode))

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
  :bind (("<f8>" . magit)
         ("C-c m s" . magit-status)
         ("C-c m d" . magit-dispatch)
         ("C-c m f" . magit-file-dispatch)))

(use-package objc-font-lock
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-italic nil)
  (setq doom-themes-enable-bold t)
  (load-theme 'doom-tokyo-night t)
  (doom-themes-org-config))

(use-package lua-mode
  :ensure t)

(use-package atom-one-dark-theme
  :ensure t)

(use-package swift-mode
  :ensure t
  :init
  (setq swift-mode:basic-offset 2))

(use-package glsl-mode
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode
  ("README\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "multimarkdown"))

(use-package ellama
  :ensure t
  :init
  (require 'llm-ollama)
  (setopt ellama-provider
          (make-llm-ollama
           :chat-model "llama2"
           :embedding-model "codellama")))

(use-package jaword
  :ensure t
  :init
  (global-jaword-mode))

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
       (defun interpolate-page-up (&optional arg)
         "Interpolate page up."
         (interactive "^p")
         (dotimes (or arg 1) (pixel-scroll-interpolate-up)))
       (defun interpolate-page-down (&optional arg)
         "Interpolate page down."
         (interactive "^p")
         (dotimes (or arg 1) (pixel-scroll-interpolate-down)))
       (bind-key "C-v" 'interpolate-page-down)
       (bind-key "M-v" 'interpolate-page-up)
       (bind-key "<next>" 'interpolate-page-down)
       (bind-key "<prior>" 'interpolate-page-up)))

;; Undo/redo.
(unbind-key "C-_")
(unbind-key "C-/")
(unbind-key "C-x u")
(unbind-key "C-?")
(unbind-key "C-M-_")
(bind-key "C-|" 'undo-redo)
(bind-key "s-Z" 'undo-redo)

(unbind-key "C-M-S-v")
(unbind-key "C-M-v")
(bind-key "M-[" 'scroll-other-window-down)
(bind-key "M-]" 'scroll-other-window)

(unbind-key "M-{")
(unbind-key "M-}")
(bind-key "M-n" 'forward-paragraph)
(bind-key "M-p" 'backward-paragraph)

(bind-keys ("C-s-<right>" . forward-word)
           ("C-." . forward-word)
           ("C-s-<left>" . backward-word)
           ("C-," . backward-word))

(bind-keys ("M-f" . forward-to-word)
           ("M-<right>" . forward-to-word)
           ("M-b" . backward-to-word)
           ("M-<left>" . backward-to-word))

(if (= os-type os-windows)
    (bind-key "C-<f4>" 'kill-this-buffer))

(bind-key "C-c l" 'duplicate-dwim)

(bind-key "C-M-f" 'forward-sexp)
(bind-key "C-M-b" 'backward-sexp)
(bind-key "C-M-<backspace>" 'backward-kill-sexp)
(bind-key "C-M-<delete>" 'kill-sexp)

(bind-key "C-<prior>" (lambda (&optional arg)
                        "Scroll arg lines down."
                        (interactive "^p")
                        (pixel-scroll-down (or arg 1))))
(bind-key "C-<next>" (lambda (&optional arg)
                       "Scroll arg lines up."
                       (interactive "^p")
                       (pixel-scroll-up (or arg 1))))

(bind-key "C-M-<prior>" (lambda (&optional arg)
                          "Scroll 5*arg lines down."
                          (interactive "^p")
                          (pixel-scroll-down (* (or arg 1) 5))))
(bind-key "C-M-<next>" (lambda (&optional arg)
                         "Scroll 5*arg lines up."
                         (interactive "^p")
                         (pixel-scroll-up (* (or arg 1) 5))))

(bind-key "M-<up>" (lambda (&optional arg)
                     "Move 5*arg lines up."
                     (interactive "^p")
                     (previous-line (* (or arg 1) 5))))
(bind-key "M-<down>" (lambda (&optional arg)
                     "Move 5*arg lines up."
                     (interactive "^p")
                     (next-line (* (or arg 1) 5))))

;; Binding LSP related keys.
(bind-keys ("<f12>" . xref-find-definitions)
           ("C-<f12>" . xref-find-references))

(bind-keys ([remap find-file] . helm-find-files)
           ([remap execute-extended-command] . helm-M-x)
           ([remap occur] . helm-occur)
           ([remap list-buffers] . helm-buffers-list)
           ([remap apropos-command] . helm-apropos)
           ([remap complete] . helm-company))

(bind-keys ([remap comment-region] . comment-or-uncomment-region))

(bind-keys :map projectile-mode-map
           ("C-c p" . projectile-command-map))

;; Replace
(bind-keys ("C-c r s" . replace-string)
           ("C-c r r" . replace-regexp)
           ("C-c r q" . query-replace-regexp)
           ("C-c r p" . project-query-replace-regexp))

;; Locate
(cond ((= os-type os-macos)
       (setq helm-locate-command "mdfind -name %s %s 2> /dev/null")
       (setq helm-locate-fuzzy-match nil))
      ((= os-type os-windows)
       (setq helm-locate-command "es -full-path-and-name %s %s")
       (setq helm-locate-fuzzy-match nil)))

(bind-key "M-<f2>" 'helm-for-files)

(cond ((= os-type os-macos)
       (defun lookup-word-on-macos-dictionary()
         "Lookup word at point in macOS dictionary."
         (interactive)
         (call-process-shell-command (format "open dict://%s" (word-at-point))))
       (bind-key "C-c <f1>" 'lookup-word-on-macos-dictionary))
      (t
       (bind-key "C-c <f1>" 'dictionary-search)))

(cond ((= os-type os-windows)
       (setq w32-pass-lwindow-to-system nil)
       (setq w32-lwindow-modifier 'super)
       (setq w32-pass-rwindow-to-system nil)
       (setq w32-rwindow-modifier 'alt)
       (w32-register-hot-key [s-]))
      ((= os-type os-macos)
       (setq mac-command-modifier 'meta)
       (setq mac-option-modifier 'super)
       (setq mac-right-option-modifier 'alt)
       (setq mac-right-command-modifier 'hyper)))

(cond ((= os-type os-macos)
       (bind-key "M-," 'customize)
       (bind-key "H-l" 'scroll-lock-mode)
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
(cond ((= os-type os-windows)
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
(setq c-offsets-alist
      '((brace-list-open . 0)
        (substatement-open . 0)))

(setq c-hanging-braces-alist
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
            (display-line-numbers-mode)
            (display-fill-column-indicator-mode 1)))

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
            (setq display-fill-column-indicator-column 100)
            (setq fill-column 100)
            (display-fill-column-indicator-mode 1)
            (visual-line-mode 1)))

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
            (add-to-list 'current-indent-rules '((node-is "preproc_arg") parent-bol c-ts-mode-indent-offset))
            (add-to-list 'current-indent-rules '((and no-node (parent-is "preproc_arg")) parent-bol 0))
            (setf (alist-get 'cpp treesit-simple-indent-rules) current-indent-rules)))

;; EGLOT hooks.
(add-hook 'c-mode-hook
          (lambda ()
            (cond ((eq major-mode 'hlsl-mode))
                  (t
                   (eglot-ensure)))))

(add-hook 'c-ts-mode-hook 'eglot-ensure)
(add-hook 'c++-ts-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
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
               `((c-mode c++-mode c-ts-mode c++-ts-mode) . ("clangd"
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

(if (= os-type os-macos)
    (with-eval-after-load 'eglot
      (add-to-list 'eglot-server-programs
                   `(swift-mode . ("xcrun" "sourcekit-lsp")))))

;; Visualize whitespaces.
(global-whitespace-mode)

;; Window history.
(winner-mode 1)

;; Auto-revert buffer.
(global-auto-revert-mode t)

;; Ellama instant buffer workaround.
(with-eval-after-load 'ellama
  (defun ellama-instant (prompt)
    "Prompt ellama for PROMPT to reply instantly."
    (let ((buffer (get-buffer-create (make-temp-name ellama-buffer))))
      (display-buffer buffer)
      (with-current-buffer buffer (funcall ellama-buffer-mode))
      (ellama-stream prompt :buffer buffer (point-min)))))

(provide 'init)
;;; init.el ends here

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
