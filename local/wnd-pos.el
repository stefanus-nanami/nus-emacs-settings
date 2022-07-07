;; Window positioning functions.

(provide 'wnd-pos)

(defun arrange-frame-center (&optional frame)
  ;; Center FRAME on the screen.
  ;; Frame be a frame name, a terminal name, or a frame.
  ;; If FRAME is omitted or nil, use currently selected frame.
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.5) (left . 0.5)))))

(defun arrange-frame-right (&optional frame)
  ;; Arrage FRAME to right of screen.
  ;; Frame be a frame name, a terminal name, or a frame.
  ;; If FRAME is omitted or nil, use currently selected frame.
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (setq-local wnd-pos-wa (frame-monitor-workarea frame)
                wnd-pos-wa-width (nth 2 wnd-pos-wa)
                wnd-pos-wa-offset (nth 0 wnd-pos-wa)
                wnd-pos-width (- wnd-pos-wa-width wnd-pos-wa-offset)
                wnd-pos-f-double-width (* (frame-pixel-width) 2)
                wnd-pos-margin (/ (- wnd-pos-wa-width wnd-pos-f-double-width) 3)
                wnd-pos-mr (- 1.0 (/ (float wnd-pos-margin) (float wnd-pos-width)))
                wnd-pos-frame-parameters '((user-position . t) (top . 0.5)))
    (add-to-list 'wnd-pos-frame-parameters `(left . ,wnd-pos-mr))
    (modify-frame-parameters frame wnd-pos-frame-parameters)))

(defun arrange-frame-left (&optional frame)
  ;; Arrage FRAME to right of screen.
  ;; Frame be a frame name, a terminal name, or a frame.
  ;; If FRAME is omitted or nil, use currently selected frame.
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (setq-local wnd-pos-wa (frame-monitor-workarea frame)
                wnd-pos-wa-width (nth 2 wnd-pos-wa)
                wnd-pos-wa-offset (nth 0 wnd-pos-wa)
                wnd-pos-width (- wnd-pos-wa-width wnd-pos-wa-offset)
                wnd-pos-f-double-width (* (frame-pixel-width) 2)
                wnd-pos-margin (/ (- wnd-pos-wa-width wnd-pos-f-double-width) 3)
                wnd-pos-mr (/ (float wnd-pos-margin) (float wnd-pos-width))
                wnd-pos-frame-parameters '((user-position . t) (top . 0.5)))
    (add-to-list 'wnd-pos-frame-parameters `(left . ,wnd-pos-mr))
    (modify-frame-parameters frame wnd-pos-frame-parameters)))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

