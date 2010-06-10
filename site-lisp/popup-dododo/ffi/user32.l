;;;; -*- mode: lisp; package: popup-dododo.ffi -*-
;;;;
;;;; File: popup-dododo/ffi/user32.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007 MIYAMUKO Katsuyuki.
;;;;
;;;;   popup-dododo is released under an MIT license.
;;;;   See popup-dododo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "popup-dododo/ffi/package")
  )

(in-package :popup-dododo.ffi)

(c:*define-dll-entry
  BOOL
  GetCaretPos ((POINT *))
  "user32")

(c:*define-dll-entry
  BOOL
  ClientToScreen (HWND (POINT *))
  "user32")


(provide "popup-dododo/ffi/user32")

;;;; End
