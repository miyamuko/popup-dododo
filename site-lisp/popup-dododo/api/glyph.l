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

(define-glyph ■ 0)
(define-glyph 　 1)


(define-glyph ドッギャァーン 38)
(define-glyph ズキュゥゥゥン 39)
(define-glyph メメタァ 40)
(define-glyph スォォォ 41)
(define-glyph フワリ… 42)
(define-glyph ガッシン 43)

;; alias
(define-glyph ドギャン 38 nil)
(define-glyph ドギャーン 38 nil)

(define-glyph ドッギャン 38 nil)
(define-glyph ドッギャーン 38 nil)

(define-glyph ドッギャァン 38 nil)
(define-glyph ドッギャァァン 38 nil)
(define-glyph ドッギャァァァン 38 nil)

(define-glyph ドッギャァァーン 38 nil)
(define-glyph ドッギャァァァーン 38 nil)

(define-glyph ドッギャァァーーン 38 nil)
(define-glyph ドッギャァァァーーン 38 nil)

(define-glyph ズキュン 39 nil)
(define-glyph ズキューン 39 nil)
(define-glyph ズキュゥン 39 nil)
(define-glyph ズキュゥゥン 39 nil)

(define-glyph ズキュゥゥゥゥン 39 nil)
(define-glyph ズキュゥゥゥゥゥン 39 nil)

(define-glyph ズキュウン 39 nil)
(define-glyph ズキュウウン 39 nil)
(define-glyph ズキュウウウン 39 nil)
(define-glyph ズキュウウウウン 39 nil)
(define-glyph ズキュウウウウウン 39 nil)

(define-glyph メメタア 40 nil)

(define-glyph スォ 41 nil)
(define-glyph スォォ 41 nil)

(define-glyph スォォォォ 41 nil)
(define-glyph スォォォォォ 41 nil)

(define-glyph スオ 41 nil)
(define-glyph スオオ 41 nil)
(define-glyph スオオオ 41 nil)
(define-glyph スオオオオ 41 nil)
(define-glyph スオオオオオ 41 nil)

(define-glyph フワリ 42 nil)

(define-glyph ガシン 43 nil)
(define-glyph ガッシン 43 nil)
(define-glyph ガッシーン 43 nil)



;;; ド & ゴ

(define-glyph ド1 2)
(define-glyph ド2 3)
(define-glyph ド3 4)
(define-glyph ド4 5)
(define-glyph ド5 6)
(define-glyph ド6 7)
(define-glyph ド7 8)
(define-glyph ド8 9)
(define-glyph ド9 10)
(define-glyph ド10 11)
(define-glyph ド11 12)
(define-glyph ド12 13)
(define-glyph ド13 14)
(define-glyph ド14 15)
(define-glyph ド15 16)
(define-glyph ド16 17)
(define-glyph ド17 18)
(define-glyph ド18 19)
(define-glyph ド19 20)
(define-glyph ド20 21)
(define-glyph ド21 22)
(define-glyph ド22 23)
(define-glyph ド23 24)
(define-glyph ド24 25)
(define-glyph ド25 26)
(define-glyph ド26 27)
(define-glyph ド27 28)
(define-glyph ド28 29)
(define-glyph ド29 30)
(define-glyph ド30 31)
(define-glyph ド31 32)
(define-glyph ド32 33)
(define-glyph ド33 34)
(define-glyph ド34 35)
(define-glyph ド35 36)

(define-glyph ゴ1 44)
(define-glyph ゴ2 45)
(define-glyph ゴ3 46)
(define-glyph ゴ4 47)
(define-glyph ゴ5 48)
(define-glyph ゴ6 49)
(define-glyph ゴ7 50)
(define-glyph ゴ8 51)
(define-glyph ゴ9 52)
(define-glyph ゴ10 53)
(define-glyph ゴ11 54)
(define-glyph ゴ12 55)
(define-glyph ゴ13 56)
(define-glyph ゴ14 57)
(define-glyph ゴ15 58)
(define-glyph ゴ16 59)
(define-glyph ゴ17 60)
(define-glyph ゴ18 61)
(define-glyph ゴ19 62)
(define-glyph ゴ20 63)
(define-glyph ゴ21 64)
(define-glyph ゴ22 65)
(define-glyph ゴ23 66)
(define-glyph ゴ24 67)
(define-glyph ゴ25 68)
(define-glyph ゴ26 69)
(define-glyph ゴ27 70)
(define-glyph ゴ28 71)
(define-glyph ゴ29 72)
(define-glyph ゴ30 73)
(define-glyph ゴ31 74)
(define-glyph ゴ32 75)
(define-glyph ゴ33 76)
(define-glyph ゴ34 77)
(define-glyph ゴ35 78)
(define-glyph ゴ36 79)
(define-glyph ゴ37 80)
(define-glyph ゴ38 81)
(define-glyph ゴ39 82)
(define-glyph ゴ40 83)
(define-glyph ゴ41 84)
(define-glyph ゴ42 85)
(define-glyph ゴ43 86)
(define-glyph ゴ44 87)
(define-glyph ゴ45 88)

(defconstant dododo-glyph-min 0)
(defconstant dododo-glyph-max 88)

(defconstant dododo-glyph-names
  '("■"
    "　"
    "ドッギャァーン"
    "ズキュウウウン"
    "メメタァ"
    "スォォォ"
    "フワリ…"
    "ガッシン"
    "ド[1-35]"
    "ゴ[1-45]"
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
             (plain-error "不正な glyph 名です `~A'.~%有効な値 (~{:~A~^ ~})" name dododo-glyph-names))
           (dododo-glyph-check-range (symbol-value const))))
        (t
         (error 'type-error
                :datum name
                :expected-type (or string symbol)))))

(defun dododo-glyph-check-range (glyph)
  (unless (<= dododo-glyph-min glyph dododo-glyph-max)
    (plain-error "不正な glyph 番号です `~D': (~D-~D)"
                 glyph
                 dododo-glyph-min
                 dododo-glyph-max))
  glyph)

(provide "popup-dododo/api/glyph")

;;; End
