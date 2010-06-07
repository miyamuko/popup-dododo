;;; -*- mode: lisp; package: popup-dododo.api -*-
;;;
;;; File: popup-dododo/api/glyph.l
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

(export '(*popup-dododo-glyph-name-list*
          ))

(defparameter *popup-dododo-glyph-name-list* nil)

(defmacro define-glyph (name index &optional (register t))
  (let ((const (intern (format nil "dododo-~A" name) :popup-dododo.api)))
    `(progn
       (defconstant ,const ,index)
       (when ,register
         (setf *popup-dododo-glyph-name-list*
               (append *popup-dododo-glyph-name-list*
                       (list ,(intern (string name) :keyword)))))
       (export ',const))))

(define-glyph �� 0)
(define-glyph �@ 1)


(define-glyph �h�b�M���@�[�� 38)
(define-glyph �Y�L���D�D�D�� 39)
(define-glyph �����^�@ 40)
(define-glyph �X�H�H�H 41)
(define-glyph �t�����c 42)
(define-glyph �K�b�V�� 43)

;; alias
(define-glyph �h�M���� 38 nil)
(define-glyph �h�M���[�� 38 nil)

(define-glyph �h�b�M���� 38 nil)
(define-glyph �h�b�M���[�� 38 nil)

(define-glyph �h�b�M���@�� 38 nil)
(define-glyph �h�b�M���@�@�� 38 nil)
(define-glyph �h�b�M���@�@�@�� 38 nil)

(define-glyph �h�b�M���@�@�[�� 38 nil)
(define-glyph �h�b�M���@�@�@�[�� 38 nil)

(define-glyph �h�b�M���@�@�[�[�� 38 nil)
(define-glyph �h�b�M���@�@�@�[�[�� 38 nil)

(define-glyph �Y�L���� 39 nil)
(define-glyph �Y�L���[�� 39 nil)
(define-glyph �Y�L���D�� 39 nil)
(define-glyph �Y�L���D�D�� 39 nil)

(define-glyph �Y�L���D�D�D�D�� 39 nil)
(define-glyph �Y�L���D�D�D�D�D�� 39 nil)

(define-glyph �Y�L���E�� 39 nil)
(define-glyph �Y�L���E�E�� 39 nil)
(define-glyph �Y�L���E�E�E�� 39 nil)
(define-glyph �Y�L���E�E�E�E�� 39 nil)
(define-glyph �Y�L���E�E�E�E�E�� 39 nil)

(define-glyph �����^�A 40 nil)

(define-glyph �X�H 41 nil)
(define-glyph �X�H�H 41 nil)

(define-glyph �X�H�H�H�H 41 nil)
(define-glyph �X�H�H�H�H�H 41 nil)

(define-glyph �X�I 41 nil)
(define-glyph �X�I�I 41 nil)
(define-glyph �X�I�I�I 41 nil)
(define-glyph �X�I�I�I�I 41 nil)
(define-glyph �X�I�I�I�I�I 41 nil)

(define-glyph �t���� 42 nil)

(define-glyph �K�V�� 43 nil)
(define-glyph �K�b�V�� 43 nil)
(define-glyph �K�b�V�[�� 43 nil)



;;; �h & �S

(define-glyph �h1 2)
(define-glyph �h2 3)
(define-glyph �h3 4)
(define-glyph �h4 5)
(define-glyph �h5 6)
(define-glyph �h6 7)
(define-glyph �h7 8)
(define-glyph �h8 9)
(define-glyph �h9 10)
(define-glyph �h10 11)
(define-glyph �h11 12)
(define-glyph �h12 13)
(define-glyph �h13 14)
(define-glyph �h14 15)
(define-glyph �h15 16)
(define-glyph �h16 17)
(define-glyph �h17 18)
(define-glyph �h18 19)
(define-glyph �h19 20)
(define-glyph �h20 21)
(define-glyph �h21 22)
(define-glyph �h22 23)
(define-glyph �h23 24)
(define-glyph �h24 25)
(define-glyph �h25 26)
(define-glyph �h26 27)
(define-glyph �h27 28)
(define-glyph �h28 29)
(define-glyph �h29 30)
(define-glyph �h30 31)
(define-glyph �h31 32)
(define-glyph �h32 33)
(define-glyph �h33 34)
(define-glyph �h34 35)
(define-glyph �h35 36)

(define-glyph �S1 44)
(define-glyph �S2 45)
(define-glyph �S3 46)
(define-glyph �S4 47)
(define-glyph �S5 48)
(define-glyph �S6 49)
(define-glyph �S7 50)
(define-glyph �S8 51)
(define-glyph �S9 52)
(define-glyph �S10 53)
(define-glyph �S11 54)
(define-glyph �S12 55)
(define-glyph �S13 56)
(define-glyph �S14 57)
(define-glyph �S15 58)
(define-glyph �S16 59)
(define-glyph �S17 60)
(define-glyph �S18 61)
(define-glyph �S19 62)
(define-glyph �S20 63)
(define-glyph �S21 64)
(define-glyph �S22 65)
(define-glyph �S23 66)
(define-glyph �S24 67)
(define-glyph �S25 68)
(define-glyph �S26 69)
(define-glyph �S27 70)
(define-glyph �S28 71)
(define-glyph �S29 72)
(define-glyph �S30 73)
(define-glyph �S31 74)
(define-glyph �S32 75)
(define-glyph �S33 76)
(define-glyph �S34 77)
(define-glyph �S35 78)
(define-glyph �S36 79)
(define-glyph �S37 80)
(define-glyph �S38 81)
(define-glyph �S39 82)
(define-glyph �S40 83)
(define-glyph �S41 84)
(define-glyph �S42 85)
(define-glyph �S43 86)
(define-glyph �S44 87)
(define-glyph �S45 88)

(defconstant dododo-glyph-min 0)
(defconstant dododo-glyph-max 88)

(defconstant dododo-glyph-names
  '("��"
    "�@"
    "�h�b�M���@�[��"
    "�Y�L���E�E�E��"
    "�����^�@"
    "�X�H�H�H"
    "�t�����c"
    "�K�b�V��"
    "�h[1-35]"
    "�S[1-45]"
    ))

(defun dododo-glyph-name->const0 (&rest names)
  (let ((const (intern (format nil "dododo-~{~A~}" names) :popup-dododo.api)))
    (when (boundp const)
      const)))

(defun dododo-glyph-name->const (name &key fallback-to)
  (or (dododo-glyph-name->const0 name)
      (flet ((seqlast (seq)
               (subseq seq (1- (length seq))))
             (num? (str)
               (multiple-value-bind (r pos)
                   (parse-integer str :junk-allowed t)
                 (and r (= (length str) pos)))))
        (when (and fallback-to (not (num? (seqlast name))))
          (dododo-glyph-name->const0 name fallback-to)))))

(defun dododo-get-glyph-index (name)
  (cond ((numberp name)
         (dododo-glyph-check-range name))
        ((symbolp name)
         (dododo-get-glyph-index (string name)))
        ((stringp name)
         (let ((const (dododo-glyph-name->const name :fallback-to 1)))
           (unless const
             (plain-error "�s���� glyph ���ł� `~A'.~%�L���Ȓl (~{:~A~^ ~})" name dododo-glyph-names))
           (dododo-glyph-check-range (symbol-value const))))
        (t
         (error 'type-error
                :datum name
                :expected-type (or string symbol)))))

(defun dododo-glyph-check-range (glyph)
  (unless (<= dododo-glyph-min glyph dododo-glyph-max)
    (plain-error "�s���� glyph �ԍ��ł� `~D': (~D-~D)"
                 glyph
                 dododo-glyph-min
                 dododo-glyph-max))
  glyph)

(provide "popup-dododo/api/glyph")

;;; End