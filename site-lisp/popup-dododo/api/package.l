;;;; -*- mode: lisp; package: popup-dododo.api -*-
;;;;
;;;; File: popup-dododo/api/package.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007 MIYAMUKO Katsuyuki.
;;;;
;;;;   popup-dododo is released under an MIT license.
;;;;   See popup-dododo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "foreign")
  (require "wip/winapi")

  (require "cairo")
  (require "layered-window")

  (require "popup-dododo/ffi")

  (unless (find-package :popup-dododo.api)
    (defpackage :popup-dododo.api
      (:use
       :lisp
       :cairo :cairo.ext
       :layered-window.api
       :popup-dododo.ffi
       )
      (:import-from :winapi
       HWND
       UINT
       WPARAM
       LPARAM
       LRESULT
       HTCAPTION

       CS_HREDRAW
       CS_VREDRAW
       GWL_STYLE
       SW_HIDE
       SW_SHOWNA
       WM_NCHITTEST
       WM_NCRBUTTONUP
       WM_PAINT
       WS_BORDER
       WS_POPUP
       WS_VISIBLE

       make-PAINTSTRUCT

       make-POINT
       POINT-x
       POINT-y

       make-WNDCLASS
       WNDCLASS-lpszClassName
       WNDCLASS-style
       WNDCLASS-lpfnWndProc
       WNDCLASS-cbClsExtra
       WNDCLASS-cbWndExtra
       WNDCLASS-hInstance
       WNDCLASS-hIcon
       WNDCLASS-hCursor
       WNDCLASS-hbrBackground
       WNDCLASS-lpszMenuName

       BeginPaint
       CreateWindow
       DefWindowProc
       DestroyWindow
       EndPaint
       GetCursorPos
       GetDC
       GetModuleHandle
       GetWindowLong
       MoveWindow
       RegisterClass
       ShowWindow
       )
      )))

(provide "popup-dododo/api/package")

;;;; End
