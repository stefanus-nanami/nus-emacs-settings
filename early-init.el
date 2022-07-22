;; Set default window position and  size.

(setq-local localhost-name (nth 0 (split-string system-name "\\."))
            frame-width 140
            frame-height 90)

(cond ((string= localhost-name "CT043472")
       (setq-local frame-height 68 frame-width 120))
      ((string= localhost-name "CT046608")
       (setq-local frame-height 100 frame-width 140)))

(setq default-frame-alist '((font . "Bitstream Vera Sans Mono-10")))
(add-to-list 'default-frame-alist `(height . ,frame-height))
(add-to-list 'default-frame-alist `(width . ,frame-width))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

