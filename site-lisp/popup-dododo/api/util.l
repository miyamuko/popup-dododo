;;; -*- mode: lisp; package: popup-dododo.api -*-
;;;
;;; File: popup-dododo/api/util.l
;;;
;;; License:
;;;
;;;   Copyright (c) 2007 MIYAMUKO Katsuyuki.
;;;
;;;   popup-dododo is released under an MIT license.
;;;   See popup-dododo/docs/MIT-LICENSE for full license.
;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "popup-dododo/package")
  )

(in-package :popup-dododo.api)

(defun calc-pos-x (left right size x-repeat)
  (cond (left left)
        (right (- right (* size x-repeat)))
        (t 0)))

(defun calc-pos-y (top bottom size y-repeat)
  (cond (top top)
        (bottom (- bottom (* size y-repeat)))
        (t 0)))


(provide "popup-dododo/api/util")

;;; End
