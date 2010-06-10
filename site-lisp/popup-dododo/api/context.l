;;;; -*- mode: lisp; package: popup-dododo.api -*-
;;;;
;;;; File: popup-dododo/api/context.l
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
  )

(in-package :popup-dododo.api)


(defparameter *window-context-hash* (make-hash-table))

(defstruct window-context
  hwnd
  x y h w
  repeat
  font-size
  font-color
  font-index
  handler
  )

(defun get-window-context (hwnd)
  (gethash hwnd *window-context-hash*))

(defun put-window-context (hwnd context)
  (setf (gethash hwnd *window-context-hash*) context))

(defun remove-window-context (hwnd)
  (remhash hwnd *window-context-hash*))

(defun window-context-exist-p (hwnd)
  (cdr (multiple-value-list (get-window-context hwnd))))

(defun list-window-context ()
  (let ((r))
    (maphash #'(lambda (k v)
                 (pushnew v r))
             *window-context-hash*)
    (reverse r)))

(defmacro translate-to-window-context ((var hwnd-or-winctx) &body body)
  (let ((garg (gensym)))
    `(let ((,garg ,hwnd-or-winctx))
       (let ((,var (if (window-context-p ,garg)
                       ,garg
                     (get-window-context ,garg))))
         ,@body))))
(setf (get 'translate-to-window-context 'ed:lisp-indent-hook) 'with-open-file)

(defmacro translate-to-window-handle ((var hwnd-or-winctx) &body body)
  (let ((garg (gensym)))
    `(let ((,garg ,hwnd-or-winctx))
       (let ((,var (if (window-context-p ,garg)
                       (window-context-hwnd ,garg)
                     ,garg)))
         ,@body))))
(setf (get 'translate-to-window-handle 'ed:lisp-indent-hook) 'with-open-file)


(defun invoke-handler (context event &rest args)
  (let ((handler (cadr (assoc event (window-context-handler context)))))
    (when handler
      (apply handler (cons context args)))))


(provide "popup-dododo/api/context")

;;;; End
