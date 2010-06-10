;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: popup-dododo/ffi/package.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007 MIYAMUKO Katsuyuki.
;;;;
;;;;   popup-dododo is released under an MIT license.
;;;;   See popup-dododo/docs/MIT-LICENSE for full license.
;;;;

(in-package :user)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "foreign")
  (require "wip/winapi")

  (unless (find-package :popup-dododo.ffi)
    (defpackage :popup-dododo.ffi
      (:use
       :lisp
       )
      (:import-from :winapi
       BOOL
       HWND
       POINT
       )
      )))


(provide "popup-dododo/ffi/package")

;;;; End
