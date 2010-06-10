;;;; -*- mode: lisp; package: popup-dododo.api -*-
;;;;
;;;; File: popup-dododo/api/window.l
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
  (require "popup-dododo/api/util")
  )

(in-package :popup-dododo.api)

(export '(destroy-all-dododo-window
          destroy-dododo-window
          dododo-window-exist-p
          dododo-window-visible-p
          move-dododo-window
          show-dododo-window
          hide-dododo-window
          ))


(defconstant window-class "PopupDoDoDoWindowClass")

(defparameter *popup-dododo-debug-p* nil)

(defun create-dododo-window (parent winctx)
  (register-class-once)
  (let ((hwnd (CreateWindow (si:make-string-chunk window-class)
                            (si:make-string-chunk "")
                            (logior WS_POPUP (if *popup-dododo-debug-p* WS_BORDER 0))
                            (window-context-x winctx)
                            (window-context-y winctx)
                            (window-context-w winctx)
                            (window-context-h winctx)
                            parent 0 (GetModuleHandle 0) 0)))
    (setf (window-context-hwnd winctx) hwnd)
    (put-window-context hwnd winctx)
    winctx))

(defun dododo-window-exist-p (winctx)
  (translate-to-window-handle (hwnd winctx)
    (unless hwnd
      (return-from dododo-window-exist-p nil))
    (when (and (window-context-exist-p hwnd)
               (not (zerop (GetWindowLong hwnd GWL_STYLE))))
      (return-from dododo-window-exist-p t))
    ;; invalid hwnd?
    (remove-window-context hwnd)
    nil))

(defun dododo-window-visible-p (winctx)
  (translate-to-window-handle (hwnd winctx)
    (when hwnd
      (let ((flags (GetWindowLong hwnd GWL_STYLE)))
        (not (zerop (logand flags WS_VISIBLE)))))))

(defun move-dododo-window (winctx &key top left bottom right (repaint nil))
  (translate-to-window-handle (hwnd winctx)
    (when hwnd
      (let* ((size (window-context-font-size winctx))
             (repeat (window-context-repeat winctx))
             (x (calc-pos-x left right size (car repeat)))
             (y (calc-pos-x top bottom size (cdr repeat))))
        (MoveWindow hwnd x y
                    (window-context-w winctx)
                    (window-context-h winctx)
                    (if repaint 1 0))
        (setf (window-context-x winctx) x
              (window-context-y winctx) y)))))

(defun show-dododo-window (winctx)
  (translate-to-window-handle (hwnd winctx)
    (when hwnd
      (ShowWindow hwnd SW_SHOWNA))))

(defun hide-dododo-window (winctx)
  (translate-to-window-handle (hwnd winctx)
    (when hwnd
      (ShowWindow hwnd SW_HIDE))))

(defun destroy-dododo-window (winctx)
  (translate-to-window-handle (hwnd winctx)
    (when hwnd
      (unwind-protect
          (DestroyWindow hwnd)
        (remove-window-context hwnd)))))

(defun destroy-all-dododo-window ()
  (dolist (winctx (list-window-context))
    (destroy-dododo-window winctx)))


(defparameter *window-calss-id* nil)
(defun register-class-once ()
  (unless *window-calss-id*
    (let ((wc (make-WNDCLASS)))
      (setf (WNDCLASS-lpszClassName wc) (si:make-string-chunk window-class)
            (WNDCLASS-style wc) (logior CS_HREDRAW CS_VREDRAW)
            (WNDCLASS-lpfnWndProc wc) #'window-proc
            (WNDCLASS-cbClsExtra wc) 0
            (WNDCLASS-cbWndExtra wc) 0
            (WNDCLASS-hInstance wc) (GetModuleHandle 0)
            (WNDCLASS-hIcon wc) 0
            (WNDCLASS-hCursor wc) 0
            (WNDCLASS-hbrBackground wc) 0
            (WNDCLASS-lpszMenuName wc) 0)
      (let ((r (RegisterClass wc)))
        (unless (zerop r)
          (setf *window-calss-id* r)))))
  *window-calss-id*)

(defun window-proc-impl (hwnd msg wparam lparam)
  (translate-to-window-context (winctx hwnd)
    (cond ((= msg WM_NCRBUTTONUP)
           (destroy-dododo-window hwnd))
          ((= msg WM_NCHITTEST)
           (return-from window-proc-impl HTCAPTION))
          ((= msg WM_PAINT)
           (let* ((ps (make-PAINTSTRUCT)) ;; Ç»ÇÒÇ©Ç±ÇÃÇ†ÇΩÇËÇ™Ç»Ç¢Ç∆ÇæÇﬂÅH
                  (hdc (BeginPaint hwnd ps)))
             (invoke-handler winctx :on-paint hwnd hdc)
             (EndPaint hwnd ps))
           (return-from window-proc-impl 0))))
  (DefWindowProc hwnd msg wparam lparam))

(unless (fboundp 'window-proc)
  (c:defun-c-callable LRESULT window-proc ((HWND hwnd)
                                           (UINT msg)
                                           (WPARAM wparam)
                                           (LPARAM lparam))
    (window-proc-impl hwnd msg wparam lparam)))


(provide "popup-dododo/api/window")

;;;; End
