;;; early-init.el --- Early init script. -*- no-byte-compile: t -*-
;;; Commentary:
;;; Set default window position, size and default font.

;;; Code:
(defvar localhost-name)
(setq localhost-name (nth 0 (split-string (system-name) "\\.")))

(setq default-frame-alist nil)

;; No menu bar on Windows.
(cond ((string= system-type "windows-nt")
       (add-to-list 'default-frame-alist '(menu-bar-lines . 0))))

(add-to-list 'default-frame-alist '(tool-bar-lines . 0))

(cond ((or (string= localhost-name "CT043472") (string= localhost-name "Lyka"))
       (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono-12"))
       (add-to-list 'default-frame-alist `(left . 0.5))
       (add-to-list 'default-frame-alist `(top . 0.5))
       (add-to-list 'default-frame-alist '(fullscreen . fullheight))
       (add-to-list 'default-frame-alist `(width . 130)))
      ((or (string= localhost-name "CT046608") (string= localhost-name "CT055654"))
       (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono-10"))
       (add-to-list 'default-frame-alist `(height . 100))
       (add-to-list 'default-frame-alist `(width . 140)))
      (t
       (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono-10"))
       (add-to-list 'default-frame-alist `(left . 0))
       (add-to-list 'default-frame-alist `(top . 0))
       (add-to-list 'default-frame-alist `(height . 90))
       (add-to-list 'default-frame-alist `(width . 140))))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
