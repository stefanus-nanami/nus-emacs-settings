;;; hlsl-mode.el --- HLSL mode
;;; Commentary:
;;; Basically just add keyword syntax highlighting.

;;; Code:

(eval-when-compile
  (require 'cc-mode))

(require 'company-keywords)

(defconst hlsl-version "1.0"
  "HLSL major mode version number.")

(defconst hlsl-keywords
  (concat "\\(\\b\\(\\(Append\\|Consume\\)?Structured\\|ByteAddress\\)?Buffer\\b\\)\\|"
          "\\(\\bRW\\(ByteAddress\\|Structured\\)?Buffer\\b\\)\\|"
          "\\(\\b\\(Compile\\|Compute\\|Domain\\|Geometry\\|Pixel\\|Hull\\|Vertex\\)Shader\\b\\)\\|"
          "\\(\\b\\(\\(Sampler\\(Comparison\\)?\\)\\|\\(Blend\\|DepthStencil\\|Rasterizer\\)\\)State\\b\\)\\|"
          "\\(\\b\\(DepthStencil\\|RenderTarget\\)View\\b\\)\\|"
          "\\(\\b\\(In\\|Out\\)putPatch\\b\\)\\|"
          "\\(\\b\\(Line\\|Point\\|Triangle\\)Stream\\b\\)\\|"
          "\\(\\b\\(RW\\)?Texture\\([123]D\\|Cube\\)\\(\\(MS\\)?Array\\)?\\b\\)"))

(defconst hlsl-keyword-list
  `((,hlsl-keywords . font-lock-keyword-face)))

(define-derived-mode hlsl-mode c-mode
  "HLSL"
  "Major mode for editing HLSL shader files."
  (font-lock-add-keywords nil hlsl-keyword-list))

;; Add HLSL keywords to company keywords.
(add-to-list 'company-keywords-alist
             '(hlsl-mode
               "AppendStructuredBuffer" "asm" "asm_fragment" "BlendState" "bool" "break" "Buffer"
               "ByteAddressBuffer" "case" "cbuffer" "centroid" "class" "column_major" "compile"
               "compile_fragment" "CompileShader" "const" "continue" "ComputeShader"
               "ConsumeStructuredBuffer" "default" "DepthStencilState" "DepthStencilView" "discard"
               "do" "double" "DomainShader" "dword" "else" "export" "extern" "false" "float"
               "float2" "float3" "float4" "for" "fxgroup" "GeometryShader" "groupshared" "half"
               "half2" "half3" "half4" "if" "in" "inline" "inout" "InputPatch" "int" "int2" "int3"
               "int4" "interface" "line" "lineadj" "linear" "LineStream" "matrix" "min16float"
               "min10float" "min16int" "min12int" "min16uint" "namespace" "nointerpolation"
               "noperspective" "NULL" "out" "OutputPatch" "packoffset" "pass" "pixelfragment"
               "PixelShader" "point" "PointStream" "precise" "RasterizerState" "RenderTargetView"
               "return" "register" "row_major" "RWBuffer" "RWByteAddressBuffer" "RWStructuredBuffer"
               "RWTexture1D" "RWTexture1DArray" "RWTexture2D" "RWTexture2DArray" "RWTexture3D"
               "sample" "sampler" "SamplerState" "SamplerComparisonState" "shared" "snorm"
               "stateblock" "stateblock_state" "static" "string" "struct" "switch" "StructuredBuffer"
               "tbuffer" "technique" "technique10" "technique11" "texture" "Texture1D"
               "Texture1DArray" "Texture2D" "Texture2DArray" "Texture2DMS" "Texture2DMSArray"
               "Texture3D" "TextureCube" "TextureCubeArray" "true" "typedef" "triangle" "triangleadj"
               "TriangleStream" "uint" "uint2" "uint3" "uint4" "uniform" "unorm" "unsigned" "vector"
               "vertexfragment" "VertexShader" "void" "volatile" "while"))

(add-hook 'hlsl-mode-hook (lambda () (c-toggle-comment-style -1)))

(provide 'hlsl-mode)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

