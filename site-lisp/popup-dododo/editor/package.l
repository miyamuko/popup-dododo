;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: popup-dododo/editor/package.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007 MIYAMUKO Katsuyuki.
;;;;
;;;;   popup-dododo is released under an MIT license.
;;;;   See popup-dododo/docs/MIT-LICENSE for full license.
;;;;

#+xyzzy
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "popup-dododo/api")

  (unless (find-package :popup-dododo.editor)
    (defpackage :popup-dododo.editor
      (:use
       :lisp :editor :foreign :winapi
       :popup-dododo.api
       ))))

(provide "popup-dododo/editor/package")

;;;; End
