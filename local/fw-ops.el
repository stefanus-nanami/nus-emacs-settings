;;; fw-ops.el --- Frame/window operations
;;; Commentary:
;;; Frame/window related functions.

;;; Code:

(defun fw-ops-frame-center (&optional frame)
  "Center FRAME on the screen."
  ;; Frame be a frame name, a terminal name, or a frame.
  ;; If FRAME is omitted or nil, use currently selected frame.
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.5) (left . 0.5)))))

(defun fw-ops-frame-right (&optional frame)
  "Arrange FRAME to right of screen."
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
                wnd-pos (min 1.0 wnd-pos-mr)
                wnd-pos-frame-parameters '((user-position . t) (top . 0.5)))
    (add-to-list 'wnd-pos-frame-parameters `(left . ,wnd-pos))
    (modify-frame-parameters frame wnd-pos-frame-parameters)))

(defun fw-ops-frame-left (&optional frame)
  "Arrange FRAME to right of screen."
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
                wnd-pos (max 0.0 wnd-pos-mr)
                wnd-pos-frame-parameters '((user-position . t) (top . 0.5)))
    (add-to-list 'wnd-pos-frame-parameters `(left . ,wnd-pos))
    (modify-frame-parameters frame wnd-pos-frame-parameters)))

(defun fw-ops-swap-buffers ()
  "Put the buffer from the selected window in next window, and vice versa."
  (interactive)
  (let* ((this (selected-window))
     (other (next-window))
     (this-buffer (window-buffer this))
     (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)
    )
  )

(global-set-key (kbd "C-c w l") 'fw-ops-frame-left)
(global-set-key (kbd "C-c w r") 'fw-ops-frame-right)
(global-set-key (kbd "C-c w c") 'fw-ops-frame-center)
(global-set-key (kbd "C-c w s") 'fw-ops-swap-buffers)

(provide 'fw-ops)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

