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
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.5) (left . 0.95)))))

(defun arrange-frame-left (&optional frame)
  ;; Arrage FRAME to right of screen.
  ;; Frame be a frame name, a terminal name, or a frame.
  ;; If FRAME is omitted or nil, use currently selected frame.
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.5) (left . 0.05)))))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

