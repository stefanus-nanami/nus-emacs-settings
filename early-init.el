;;; early-init.el --- Early init script. -*- no-byte-compile: t -*-
;;; Commentary:
;;; Set default window position, size and default font.

;;; Code:
(defvar localhost-name)
(setq localhost-name (nth 0 (split-string (system-name) "\\.")))

;; Define OS type.
(setq os-unknown 0)
(setq os-windows 1)
(setq os-macos 2)
(setq os-unix 3)

(cond ((string= system-type "windows-nt")
       (setq os-type os-windows))
      ((string= system-type "darwin")
       (setq os-type os-macos))
      ((string= system-type "gnu/linux")
       (setq os-type os-macos))
      (t
       (setq os-type os-unknown)))

(setq default-frame-alist nil)

;; No menu bar on Windows.
(cond ((or (= os-type os-windows) (= os-type os-unix))
       (add-to-list 'default-frame-alist '(menu-bar-lines . 0)))
      ((= os-type os-macos)
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
       (cond ((= os-type os-unix)
              (add-to-list 'default-frame-alist `(height . 85)))
             (t
              (add-to-list 'default-frame-alist `(left . 20))
              (add-to-list 'default-frame-alist `(top . 20))
              (add-to-list 'default-frame-alist `(height . 97))))
       (add-to-list 'default-frame-alist `(width . 140)))
      (t
       (add-to-list 'default-frame-alist `(left . 0))
       (add-to-list 'default-frame-alist `(top . 0))
       (add-to-list 'default-frame-alist `(height . 60))
       (add-to-list 'default-frame-alist `(width . 120))))

(setq initial-frame-alist (copy-alist default-frame-alist))
(add-to-list 'initial-frame-alist '(background-color . "#000000"))
(add-to-list 'initial-frame-alist '(foreground-color . "#E0E0E0"))

(provide 'early-init)
;;; early-init.el ends here

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
