;;; -*- mode: lisp; package: popup-dododo.editor -*-
;;;
;;; File: popup-dododo/editor/command.l
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
  (require "popup-dododo/api")
  )

(in-package :popup-dododo.editor)

(export '(popup-dododo))

(defun point->window-position (point &key absolute)
  (popup-string "" point)
  (let ((hwnd (FindWindow (si:make-string-chunk "popup!?")
                          (si:make-string-chunk ""))))
    (ShowWindow hwnd SW_HIDE)
    (let ((r (make-RECT)))
      (GetWindowRect hwnd r)
      (values (RECT-top r)
              (RECT-left r)
              (RECT-bottom r)
              (RECT-right r)))))

(defun get-current-mouse-point ()
  (let ((pos (make-POINT)))
    (GetCursorPos pos)
    (values (POINT-x pos)
            (POINT-y pos))))

(defun calc-point (point)
  (cond ((eq point :mouse)
         (get-current-mouse-point))
        ((eq point :point)
         (calc-point (point)))
        ((integerp point)
         (multiple-value-bind (top left bottom right)
             (point->window-position point)
           (values left top)))
        (t
         (error 'type-error
                :datum point
                :expected-type '(or :mouse (point))))))

(defun popup-existing-dododo (winctx point)
  (multiple-value-bind (x y)
      (calc-point point)
    (move-dododo-window winctx :left x :bottom y)
    (show-dododo-window winctx)
    winctx))

(defun popup-dododo (glyph-name point &key size color x-repeat y-repeat
                                (timeout 1))
  (multiple-value-bind (x y)
      (calc-point point)
    (let ((winctx (popup-dododo-window :parent (get-window-handle)
                                       :left x :bottom y
                                       :size size
                                       :x-repeat x-repeat
                                       :y-repeat y-repeat
                                       :color color
                                       :font glyph-name)))
      (when timeout
        (start-timer timeout #'(lambda ()
                                 (destroy-dododo-window winctx))
                     t))
      winctx)))


(provide "popup-dododo/editor/command")

;;; End
