;;;; -*- mode: lisp; package: popup-dododo.api -*-
;;;;
;;;; File: popup-dododo/api/dododo.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007 MIYAMUKO Katsuyuki.
;;;;
;;;;   popup-dododo is released under an MIT license.
;;;;   See popup-dododo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "popup-dododo/api/package")
  (require "popup-dododo/api/context")
  (require "popup-dododo/api/window")
  (require "popup-dododo/api/glyph")
  (require "popup-dododo/api/util")
  )

(in-package :popup-dododo.api)

(export '(popup-dododo-window
          ))

(defparameter *font-face* nil)

(defun get-dododo-font-face ()
  (unless *font-face*
    (setf *font-face* (cairo-win32-font-face-create "DesktopDoDoDo")))
  *font-face*)

(defun make-dododo-glyphs (winctx)
  (let ((index (window-context-font-index winctx))
        (x-repeat (car (window-context-repeat winctx)))
        (y-repeat (cdr (window-context-repeat winctx)))
        r)
    (dotimes (x x-repeat)
      (dotimes (y y-repeat)
        (push (make-glyph :index index :x x :y (+ y 1)) r)))
    (reverse r)))

(defun draw-font (winctx hwnd hdc)
  (set-layered-window-attributes/color hwnd '(255 255 255))
  (with-cairo-surface (surface (cairo-win32-surface-create (GetDC hwnd)))
    (with-cairo (cr (cairo-create surface))
      (cairo-scale cr (window-context-font-size winctx) (window-context-font-size winctx))
      ;; draw background
      (cairo-set-source-rgb cr 1 1 1)
      (cairo-paint cr)
      ;; draw dododo
      (apply #'cairo-set-source-rgb cr (window-context-font-color winctx))
      (cairo-set-font-size cr 1)
      (cairo-set-font-face cr (get-dododo-font-face))
      (cairo-move-to cr 0 0)
      (cairo-show-glyphs cr (make-dododo-glyphs winctx))
      )))

(defun popup-dododo-window (&key parent top left bottom right x-repeat y-repeat size color font)
  (let* ((margin-ratio 1.1)
         (x-repeat (or x-repeat 1))
         (y-repeat (or y-repeat 1))
         (size (or size 100))
         (color (or color '(0 0 0)))
         (font (or font :ド1))
         (x (calc-pos-x left right size x-repeat))
         (y (calc-pos-y top bottom size y-repeat))
         (winctx (make-window-context
                  :x (if (< x 0) 0 x)
                  :y (if (< y 0) 0 y)
                  :w (* size x-repeat margin-ratio)
                  :h (* size y-repeat margin-ratio)
                  :repeat (cons x-repeat y-repeat)
                  :font-size size
                  :font-color color
                  :font-index (dododo-get-glyph-index font)
                  :handler `((:on-paint ,#'draw-font)))))
    (let ((winctx (create-dododo-window parent winctx)))
      (show-dododo-window winctx)
      winctx)))

#+xyzzy
(defun popup-dododo-test ()
  (ed::interactive)
  (show-dododo-window :parent (ed::get-window-handle)
                      :x 800 :y 300
                      :size 40
                      :x-repeat 3
                      :y-repeat 3
                      :font :ド)
  (show-dododo-window :parent (ed::get-window-handle)
                      :x 800
                      :y 400
                      :size 300
                      :y-repeat 2
                      :color '(1 0 0)
                      :font :メメタア))

#+xyzzy
(defun popup-dododo-test-close-all ()
  (ed::interactive)
  (destroy-all-dododo-window))

(provide "popup-dododo/api/dododo")

;;;; End
