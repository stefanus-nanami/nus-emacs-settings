;;; hlsl-mode.el --- HLSL mode
;;; Commentary:
;;; Basically just add keyword syntax highlighting.

;;; Code:

(eval-when-compile
  (require 'cc-mode))

(defconst hlsl-version "1.0"
  "HLSL major mode version number.")

(defconst hlsl-keywords
  '("AppendStructuredBuffer"
    "BlendState"
    "Buffer"
    "ByteAddressBuffer"
    "CompileShader"
    "ComputeShader"
    "ConsumeStructuredBuffer"
    "DepthStencilState"
    "DepthStencilView"
    "DomainShader"
    "GeometryShader"
    "Hullshader"
    "InputPatch"
    "LineStream"
    "OutputPatch"
    "PixelShader"
    "PointStream"
    "RasterizerState"
    "RenderTargetView"
    "RWBuffer"
    "RWByteAddressBuffer"
    "RWStructuredBuffer"
    "RWTexture1D"
    "RWTexture1DArray"
    "RWTexture2D"
    "RWTexture2DArray"
    "RWTexture3D"
    "SamplerState"
    "SamplerComparisonState"
    "StructuredBuffer"
    "Texture1D"
    "Texture1DArray"
    "Texture2D"
    "Texture2DArray"
    "Texture2DMS"
    "Texture2DMSArray"
    "Texture3D"
    "TextureCube"
    "TextureCubeArray"
    "TriangleStream"
    "VertexShader"))

(defconst hlsl-keyword-list
  `(
    (,(regexp-opt hlsl-keywords) . font-lock-keyword-face)
    ))

(define-derived-mode hlsl-mode c-mode
  "HLSL"
  "Major mode for editing HLSL shader files."
  (font-lock-add-keywords nil hlsl-keyword-list))

(provide 'hlsl-mode)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

