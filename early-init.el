;; Set default window position and  size.

(setq-local localhost-name (nth 0 (split-string system-name "\\.")))

(setq default-frame-alist
      (append '((font . "Bitstream Vera Sans Mono-10"))
              default-frame-alist))

(cond ((string= system-type "windows-nt")
       (add-to-list 'default-frame-alist '(menu-bar-lines . 0))))

(add-to-list 'default-frame-alist '(tool-bar-lines . 0))

(cond ((string= localhost-name "CT043472")
       (add-to-list 'default-frame-alist `(left . 0.5))
       (add-to-list 'default-frame-alist `(top . 0.5))
       (add-to-list 'default-frame-alist `(width . 120))
       (add-to-list 'default-frame-alist '(fullscreen . fullheight)))
      ((string= localhost-name "CT046608")
       (add-to-list 'default-frame-alist `(height . 100))
       (add-to-list 'default-frame-alist `(width . 140)))
      (t
       (add-to-list 'default-frame-alist `(left . 0))
       (add-to-list 'default-frame-alist `(top . 0))
       (add-to-list 'default-frame-alist `(height . 90))
       (add-to-list 'default-frame-alist `(width . 140))))

(setq load-prefer-newer t)
(add-to-list 'load-path "~/.emacs.d/local")

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
