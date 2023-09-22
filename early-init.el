;;; early-init.el --- Early init script. -*- no-byte-compile: t -*-
;;; Commentary:
;;; Set default window position, size and default font.

;;; Code:
(defvar localhost-name)
(setq localhost-name (nth 0 (split-string (system-name) "\\.")))

(setq default-frame-alist nil)

;; No menu bar on Windows.
(cond ((or (string= system-type "windows-nt") (string= system-type "gnu/linux"))
       (add-to-list 'default-frame-alist '(menu-bar-lines . 0)))
      ((string= system-type "darwin")
       (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))))

(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(alpha . (95 . 80)))

(cond ((or (string= localhost-name "CT043472")
           (string= localhost-name "Lyka"))
       (add-to-list 'default-frame-alist '(font . "Hack-10"))
       (add-to-list 'default-frame-alist `(left . 0.5))
       (add-to-list 'default-frame-alist `(top . 0.5))
       (add-to-list 'default-frame-alist '(fullscreen . fullheight))
       (add-to-list 'default-frame-alist `(width . 130)))
      ((string= localhost-name "CT058231")
       (add-to-list 'default-frame-alist '(font . "Hack-10"))
       (cond ((string= system-type "gnu/linux")
              (add-to-list 'default-frame-alist `(height . 85)))
             (t
              (add-to-list 'default-frame-alist `(left . 704))
              (add-to-list 'default-frame-alist `(top . 53))
              (add-to-list 'default-frame-alist `(height . 97))))
       (add-to-list 'default-frame-alist `(width . 140)))
      (t
       (add-to-list 'default-frame-alist `(left . 0))
       (add-to-list 'default-frame-alist `(top . 0))
       (add-to-list 'default-frame-alist `(height . 60))
       (add-to-list 'default-frame-alist `(width . 120))))

(provide 'early-init)
;;; early-init.el ends here

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
