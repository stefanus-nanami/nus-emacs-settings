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
       (setq os-type os-unix))
      (t
       (setq os-type os-unknown)))

(setq default-frame-alist nil)

;; No menu bar on Windows.
(cond ((or (= os-type os-windows) (= os-type os-unix))
       (add-to-list 'default-frame-alist '(menu-bar-lines . 0)))
      ((= os-type os-macos)
       (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))))

(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
(add-to-list 'default-frame-alist '(horizontal-scroll-bars . nil))

(cond ((or (string= localhost-name "CT043472")
           (string= localhost-name "Lyka")
           (string= localhost-name "CT054816"))
       (add-to-list 'default-frame-alist `(left . 0))
       (add-to-list 'default-frame-alist `(top . 0))
       (add-to-list 'default-frame-alist '(fullscreen . fullheight))
       (add-to-list 'default-frame-alist '(width . (text-pixels . 1024))))
      ((string= localhost-name "CT058231")
       (add-to-list 'default-frame-alist `(left . 20))
       (add-to-list 'default-frame-alist `(top . 20))
       (add-to-list 'default-frame-alist '(height . (text-pixels . 1455)))
       (add-to-list 'default-frame-alist '(width . (text-pixels . 1136))))
      (t
       (add-to-list 'default-frame-alist `(left . 0))
       (add-to-list 'default-frame-alist `(top . 0))
       (add-to-list 'default-frame-alist '(height . (text-pixels . 1024)))
       (add-to-list 'default-frame-alist '(width . (text-pixels . 768)))))

(setq initial-frame-alist (copy-alist default-frame-alist))
(add-to-list 'initial-frame-alist '(font . "Hack"))
(add-to-list 'initial-frame-alist '(background-color . "#1a1b26"))
(add-to-list 'initial-frame-alist '(foreground-color . "#a9b1d6"))

(provide 'early-init)
;;; early-init.el ends here

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
