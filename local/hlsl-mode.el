;;; hlsl-mode.el --- HLSL mode
;;; Commentary:
;;; Basically just add keyword syntax highlighting.

;;; Code:

(eval-when-compile
  (require 'cc-mode))

(defconst hlsl-version "1.0"
  "HLSL major mode version number.")

(defconst hlsl-keywords
"\\(\\b\\(\\(Append\\|Consume\\)?Structured\\|ByteAddress\\)?Buffer\\b\\)\\|\
\\(\\bRW\\(ByteAddress\\|Structured\\)?Buffer\\b\\)\\|\
\\(\\b\\(Compile\\|Compute\\|Domain\\|Geometry\\|Pixel\\|Hull\\|Vertex\\)Shader\\b\\)\\|\
\\(\\b\\(\\(Sampler\\(Comparison\\)?\\)\\|\\(Blend\\|DepthStencil\\|Rasterizer\\)\\)State\\b\\)\\|\
\\(\\b\\(DepthStencil\\|RenderTarget\\)View\\b\\)\\|\
\\(\\b\\(In\\|Out\\)putPatch\\b\\)\\|\
\\(\\b\\(Line\\|Point\\|Triangle\\)Stream\\b\\)\\|\
\\(\\b\\(RW\\)?Texture\\([123]D\\|Cube\\)\\(\\(MS\\)?Array\\)?\\b\\)")

(defconst hlsl-keyword-list
  `((,hlsl-keywords . font-lock-keyword-face)))

(define-derived-mode hlsl-mode c-mode
  "HLSL"
  "Major mode for editing HLSL shader files."
  (font-lock-add-keywords nil hlsl-keyword-list))

(provide 'hlsl-mode)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

