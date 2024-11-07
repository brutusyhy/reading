#lang sicp
(define (a-plus-abs-b a b)
  ((if (> b 0) + - ) a b))
; If b > 0, the operator becomes +
; Otherwise it would be -
; Thus, it becomes a+b if b is positive
; a-b if b is not positive