;;; -*- mode: lisp; package: user -*-
;;;
;;; File: popup-dododo/package.l
;;;
;;; License:
;;;
;;;   Copyright (c) 2007 MIYAMUKO Katsuyuki.
;;;
;;;   popup-dododo is released under an MIT license.
;;;   See popup-dododo/docs/MIT-LICENSE for full license.
;;;


(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "foreign")
  (require "wip/winapi")

  (require "cairo")
  (require "layered-window")

  (unless (find-package :popup-dododo.api)
    (defpackage :popup-dododo.api
      (:use
       :lisp :foreign :winapi
       :cairo :cairo.ext
       :layered-window.api
       )))

  #+xyzzy
  (progn
    (unless (find-package :popup-dododo.editor)
      (defpackage :popup-dododo.editor
        (:use
         :lisp :editor :foreign :winapi
         :popup-dododo.api
         )))

    ;; for convenience
    (use-package :popup-dododo.editor :editor)
    (use-package :popup-dododo.editor :user))
  )


(provide "popup-dododo/package")

;;; End
