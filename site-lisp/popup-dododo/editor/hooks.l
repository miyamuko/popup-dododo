;;; -*- mode: lisp; package: popup-dododo.editor -*-
;;;
;;; File: popup-dododo/editor/hooks.l
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
  (require "popup-dododo/editor/command")
  )

(in-package :popup-dododo.editor)

(export '(add-popup-dododo-on-mouse
          add-popup-dododo-on-command
          add-popup-dododo-on-command-char

          remove-popup-dododo-on-mouse
          remove-popup-dododo-on-command
          remove-popup-dododo-on-command-char

          clear-popup-dododo-on-mouse
          clear-popup-dododo-on-command
          clear-popup-dododo-on-command-char
          ))


(defstruct popup-definition
  event
  glyph-name
  point
  size
  color
  x-repeat
  y-repeat
  winctx
  timeout)


(defparameter *popup-definition-by-type* (make-hash-table))

;;; add

(defun add-popup-dododo-on-mouse (keycode glyph-name &rest keys)
  (global-set-mouse-handler keycode)
  (apply 'add-popup-dododo-on :mouse-after keycode :mouse glyph-name keys))

(defun add-popup-dododo-on-command (command glyph-name &rest keys)
  (add-command-hook-once)
  (apply 'add-popup-dododo-on :command-after command :point glyph-name keys))

(defun add-popup-dododo-on-command-char (command-char glyph-name &rest keys)
  (add-command-hook-once)
  (apply 'add-popup-dododo-on :command-char-after command-char :point glyph-name keys))

(defun add-popup-dododo-on (type event point glyph-name &key size color x-repeat y-repeat timeout)
  (let ((lst (gethash type *popup-definition-by-type*)))
    (setf (gethash type *popup-definition-by-type*)
          (append lst (list (make-popup-definition
                             :event event
                             :point point
                             :glyph-name glyph-name
                             :size size
                             :color color
                             :x-repeat x-repeat
                             :y-repeat y-repeat
                             :timeout timeout))))))


;;; remove

(defun remove-popup-dododo-on-mouse (keycode &optional glyph-name)
  (funcall 'remove-popup-dododo-on :mouse-after keycode glyph-name))

(defun remove-popup-dododo-on-command (command &optional glyph-name)
  (funcall 'remove-popup-dododo-on :command-after command glyph-name))

(defun remove-popup-dododo-on-command-char (command-char &optional glyph-name)
  (funcall 'remove-popup-dododo-on :command-char-after command-char glyph-name))

(defun remove-popup-dododo-on (type event glyph-name)
  (let* ((found nil)
         (predicate (if glyph-name
                        #'(lambda (def)
                            (and (eq event (popup-definition-event def))
                                 (equal glyph-name (popup-definition-glyph-name def))
                                 (setf found t)))
                      #'(lambda (def)
                          (and (eq event (popup-definition-event def))
                               (setf found t))))))
    (setf (gethash type *popup-definition-by-type*)
          (remove-if predicate (gethash type *popup-definition-by-type*)))
    found))


;;; clear

(defun clear-popup-dododo-on-mouse ()
  (funcall 'clear-popup-dododo-on :mouse-after))

(defun clear-popup-dododo-on-command ()
  (funcall 'clear-popup-dododo-on :command-after))

(defun clear-popup-dododo-on-command-char ()
  (funcall 'clear-popup-dododo-on :command-char-after))

(defun clear-popup-dododo-on (type)
  (prog1
      (if (gethash type *popup-definition-by-type*) t nil)
    (setf (gethash type *popup-definition-by-type*) nil)))


;;; popup

(defun popup-dododo-by-definition-list (event type)
  (let ((defs (remove-if-not #'(lambda (def)
                                 (eq event (popup-definition-event def)))
                             (gethash type *popup-definition-by-type*))))
    (when defs
      (popup-dododo-by-definition (nth (random (length defs)) defs)))))

(defun popup-dododo-by-definition (def)
  (let ((winctx (popup-dododo-by-definition0 def)))
    (start-timer (or (popup-definition-timeout def) 1)
                 #'(lambda ()
                     (hide-dododo-window winctx))
                 t)))

(defun popup-dododo-by-definition0 (def)
  (let ((winctx (popup-definition-winctx def)))
    (if (and winctx (dododo-window-exist-p winctx))
        (if (dododo-window-visible-p winctx)
            (popup-dododo-by-definition1 def)
          (popup-existing-dododo winctx (popup-definition-point def)))
      (setf (popup-definition-winctx def)
            (popup-dododo-by-definition1 def)))))

(defun popup-dododo-by-definition1 (def)
  (popup-dododo (popup-definition-glyph-name def)
                (popup-definition-point def)
                :size (popup-definition-size def)
                :color (popup-definition-color def)
                :x-repeat (popup-definition-x-repeat def)
                :y-repeat (popup-definition-y-repeat def)
                :timeout nil))


;;; hook

(defun global-set-mouse-handler (keycode)
  (let ((dododo-handler (intern (format nil "popup-dododo-mouse-handler-~D"
                                        (char-code keycode))))
        (original (lookup-keymap *global-keymap* keycode)))
    (unless (fboundp dododo-handler)
      (setf (symbol-function dododo-handler)
            #'(lambda ()
                (interactive)
                (popup-dododo-by-definition-list keycode :mouse-before)
                (funcall original)
                (popup-dododo-by-definition-list keycode :mouse-after)))
      (global-set-key keycode dododo-handler))))


(defun add-command-hook-once ()
  (add-hook '*post-command-hook* 'popup-dododo-post-command-hook)
  (add-hook '*pre-command-hook* 'popup-dododo-pre-command-hook))

(defun popup-dododo-post-command-hook ()
  (interactive)
  (popup-dododo-invoke-command-hook :command-before :command-char-before))

(defun popup-dododo-pre-command-hook ()
  (interactive)
  (popup-dododo-invoke-command-hook :command-after :command-char-after))

(defun popup-dododo-invoke-command-hook (command command-char)
  (popup-dododo-by-definition-list *this-command* command)
  (popup-dododo-by-definition-list *last-command-char* command-char))


(provide "popup-dododo/editor/hooks")

;;; End
