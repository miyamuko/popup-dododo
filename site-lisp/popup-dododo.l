;;; -*- mode: lisp; package: user -*-
;;;
;;; File: popup-dododo.l
;;;
;;; License:
;;;
;;;   Copyright (c) 2007 MIYAMUKO Katsuyuki.
;;;
;;;   popup-dododo is released under an MIT license.
;;;   See popup-dododo/docs/MIT-LICENSE for full license.
;;;

(in-package :user)

(require "popup-dododo/api")
(require "popup-dododo/editor")

;#+xyzzy
(progn
  ;; for convenience
  (use-package :popup-dododo.editor :editor)
  (use-package :popup-dododo.editor :user))


(provide "popup-dododo")

;; End
