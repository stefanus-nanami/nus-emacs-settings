;;; nus-snippets.el --- Snippets
;;; Commentary:
;;; My snippets.

;;; Code:

(defun nus-class (name)
  "C++ class snippet."
  (interactive "sClass name: ")
  (insert "class ")
  (insert name)
  (insert "\n")
  (insert "{\n")
  (insert "public:\n")
  (insert "\n")
  (insert "protected:\n")
  (insert "\n")
  (insert "private:\n")
  (insert "\n")
  (insert "};\n"))

(defun nus-doxyfile (name)
  "Insert file header comment."
  (interactive "sFile name: ")
  (insert "//=============================================================================\n")
  (insert "//!\n")
  (insert "//!  @file   ")
  (insert name)
  (insert "\n")
  (insert "//!  @brief  \n")
  (insert "//!  @author \n")
  (insert "//!\n")
  (insert "//=============================================================================\n"))

(defun nus-header (def)
  "Insert header guard."
  (interactive "sDefine: ")
  (insert "#ifndef ")
  (insert def)
  (insert "\n")
  (insert "#define ")
  (insert def)
  (insert "\n")
  (insert "\n")
  (insert "\n")
  (insert "\n")
  (insert "#endif\n"))

(defun nus-namesp (name)
  "C++ namespace snippet"
  (interactive "sNamespace: ")
  (insert "namespace ")
  (insert name)
  (insert "\n")
  (insert "{\n")
  (insert "\n")
  (insert "\n")
  (insert "\n")
  (insert "}\n"))

(defun nus-doxyclass (name)
  "Insert class comment."
  (interactive "sClass name: ")
  (insert "/*!\n")
  (insert " * @class ")
  (insert name)
  (insert "\n")
  (insert " * @brief \n")
  (insert " */\n"))

(defun nus-doxynamesp (name)
  "Insert namespace comment."
  (interactive "sNamespace: ")
  (insert "/*!\n")
  (insert " * @namespace ")
  (insert name)
  (insert "\n")
  (insert " * @brief \n")
  (insert " */\n"))

(defun nus-ctor ()
  (insert "//! @brief Default constructor.\n"))

(defun nus-dtor ()
  (insert "//! @brief Default destructor.\n"))

(provide 'nus-snippets)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

