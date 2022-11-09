;;; init.el --- init elisp script. -*- no-byte-compile: t -*-
;;; Commentary:
;;; My initialization script.

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu nil)
 '(ac-dictionary-files '("~/.emacs.d/.dict"))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(auto-hscroll-mode 'current-line)
 '(backup-directory-alist '(("" . "~/.emacs.d/backups")))
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
 '(c-offsets-alist '((brace-list-open . 0) (substatement-open . 0)))
 '(company-backends
   '(company-bbdb company-cmake company-clang company-capf company-semantic company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev))
 '(company-idle-delay nil)
 '(completion-search-distance 0)
 '(completion-styles '(flex basic partial-completion emacs22))
 '(current-language-environment "Japanese")
 '(custom-enabled-themes '(doom-outrun-electric))
 '(custom-safe-themes
   '("02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "ed68393e901a88b9feefea1abfa9a9c5983e166e4378c71bb92e636423bd94fd" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(display-fill-column-indicator-column 100)
 '(display-line-numbers-major-tick 50)
 '(display-line-numbers-minor-tick 10)
 '(display-line-numbers-width 5)
 '(doom-themes-enable-italic nil)
 '(dynamic-completion-mode t)
 '(electric-pair-mode t)
 '(epa-file-cache-passphrase-for-symmetric-encryption t)
 '(global-company-mode t)
 '(global-display-fill-column-indicator-mode t)
 '(global-flycheck-mode t)
 '(global-whitespace-mode t)
 '(global-whitespace-newline-mode t)
 '(gnus-thread-sort-functions
   '(gnus-thread-sort-by-most-recent-date
     (not gnus-thread-sort-by-number)))
 '(gnus-use-cache t)
 '(helm-ag-insert-at-point 'symbol)
 '(helm-ag-use-agignore 1)
 '(helm-boring-buffer-regexp-list
   '("\\` " "\\`\\*helm" "\\`\\*Echo Area" "\\`\\*Minibuf" "\\`\\*lsp" "\\`\\*clangd" "\\`\\*Flymake" "\\`\\*gcc"))
 '(helm-buffer-max-length nil)
 '(helm-command-prefix-key "C-c h")
 '(helm-commands-using-frame '(helm-company completion-at-point))
 '(helm-dabbrev-cycle-threshold 0)
 '(helm-dabbrev-ignored-buffers-regexps
   '("\\*helm" "\\*Messages" "\\*Echo Area" "\\*Buffer List" "\\*lsp" "\\*clangd" "\\*Flymake" "\\*gcc"))
 '(helm-dabbrev-separator-regexp "\\s-\\|[(\\[\\{\"'`=<>$:;,@.#+]\\|\\s\\\\|^\\|^" t)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(js2-strict-missing-semi-warning nil)
 '(lsp-enable-indentation nil)
 '(lsp-enable-on-type-formatting nil)
 '(lsp-enable-snippet nil)
 '(lsp-keymap-prefix "C-c l")
 '(lsp-ui-sideline-show-diagnostics nil)
 '(lua-indent-level 2)
 '(message-send-mail-function 'smtpmail-send-it)
 '(mm-text-html-renderer 'w3m)
 '(package-archives
   '(("melpa-stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(js2-mode lsp-ui magit auto-complete helm-company doom-themes all-the-icons doom-modeline helm-descbinds lua-mode exec-path-from-shell atom-one-dark-theme swift-mode helm-projectile projectile compat auto-compile flycheck helm-xref helm-lsp lsp-mode function-args csharp-mode glsl-mode json-mode helm-ag helm-ls-git helm bind-key))
 '(projectile-completion-system 'helm)
 '(projectile-globally-ignored-directories
   '("^\\.idea$" "^\\.vscode$" "^\\.ensime_cache$" "^\\.eunit$" "^\\.git$" "^\\.hg$" "^\\.fslckout$" "^_FOSSIL_$" "^\\.bzr$" "^_darcs$" "^\\.pijul$" "^\\.tox$" "^\\.svn$" "^\\.stack-work$" "^\\.ccls-cache$" "^\\.cache$" "^\\.clangd$" "^\\.gitlab$"))
 '(projectile-globally-ignored-file-suffixes
   '(".exe" ".dll" ".pdb" ".lib" ".obj" ".diff" ".o" ".a" ".dylib" ".so"))
 '(projectile-globally-ignored-files '("TAGS" ".git*"))
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(smtpmail-default-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
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
 '(header-line ((t (:family "Bitstream Vera Sans" :background "midnight blue" :inherit mode-line))))
 '(highlight ((t (:background "#808000" :foreground "#2e3436"))))
 '(line-number ((t (:foreground "PaleVioletRed4"))))
 '(line-number-current-line ((t (:inherit line-number :foreground "red"))))
 '(line-number-major-tick ((t (:background "gray17" :foreground "white"))))
 '(line-number-minor-tick ((t (:foreground "white"))))
 '(mode-line ((t (:background "dark slate blue" :box nil))))
 '(mode-line-inactive ((t (:background "dark slate blue" :foreground "light slate blue" :box nil))))
 '(region ((t (:extend t :background "#4d377b"))))
 '(whitespace-empty ((t (:foreground "firebrick"))))
 '(whitespace-tab ((t (:foreground "gray36")))))

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

;; Auto compile everything.
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(doom-modeline-mode 1)

(when (display-graphic-p)
  (require 'all-the-icons))

(require 'hlsl-mode)
(require 'nus-snippets)
(require 'wnd-pos)

(require 'bind-key)

(require 'lsp-mode)

(require 'helm)
(require 'helm-config)
(helm-mode 1)

(fa-config-default)

(projectile-mode +1)
(helm-projectile-on)

(require 'w3m-load)

;; Set editor default behavior.
(setq frame-title-format '("" "%f @ Emacs " emacs-version))

;; Load library for key-binding.
(require 'cc-mode)

;; Bind keys.
(unbind-key "C-\\" isearch-mode-map)
(bind-key* "C-\\" 'undo)
(unbind-key "C-z" global-map)
(bind-key "C-c g" 'helm-do-ag)
(bind-key "C-c b" 'helm-do-ag-buffers)
(bind-key "<f2>" 'helm-mini)
(bind-key "C-x x x" 'save-buffers-kill-emacs)
(bind-key "C-|" 'undo-redo)

(bind-keys :map lsp-mode-map
           ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
           ([remap xref-find-references] . lsp-ui-peek-find-references))

(bind-keys :map global-map
           ([remap find-file] . helm-find-files)
           ([remap execute-extended-command] . helm-M-x))

(unbind-key "C-c C-c" c-mode-map)
(unbind-key "C-c C-c" c++-mode-map)

(bind-key "C-c C-c" 'comment-or-uncomment-region)
(bind-key "C-c p" 'projectile-command-map 'projectile-mode-map)

;; Completions.
(bind-key "C-\"" 'helm-company)
(bind-key "C-;" 'completion-at-point)
(bind-key "C-'" 'helm-dabbrev)

;; Magit
(bind-key "C-c m s" 'magit-status)
(bind-key "C-c m d" 'magit-dispatch)
(bind-key "C-c m f" 'magit-file-dispatch)

(cond ((string= system-type "darwin")
       (bind-key "M-," 'customize))
      ((string= system-type "windows-nt")
       (bind-key "C-<f12>" 'other-frame)))

;; Map extensions to modes.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fx\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.hlsl\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(cond ((string= localhost-name "Lyka")
       (setq-default tab-width 2)
       (setq-default indent-tabs-mode nil)
       (setq-default c-basic-offset 2))
      (t
       (setq-default tab-width 4)
       (setq-default indent-tabs-mode t)
       (setq-default c-basic-offset 4)))

(setq lsp-headerline-arrow #("|" 0 1 (face lsp-headerline-breadcrumb-separator-face)))

;; Hooks

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'auto-complete-mode-hook
          (lambda()
            (bind-keys :map ac-complete-mode-map
                ("C-n" . ac-next)
                ("C-p" . ac-previous)
                ("C-v" . ac-next-page)
                ("M-v" . ac-previous-page))))

(add-hook 'js2-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)
            (lsp)))

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(add-hook 'csharp-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

(add-hook 'text-mode-hook
          (lambda()
            (auto-complete-mode t)
            (bind-key "C-'" 'ac-complete-dictionary text-mode-map)))

(add-hook 'lua-mode-hook
          (lambda()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)
            (lsp)))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

