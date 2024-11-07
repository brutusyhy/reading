#lang sicp
; Ben Bitdiddle has invented a test to determine
; whether the interpreter he is faced with is using
; applicative order evaluation or normal-order evaluation.
; He defines the following two procedures:
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
; en he evaluates the expression
(test 0 (p))
; Applicative Order
; (if (= 0 0) 0 (p))
; 0

; Normal Order
; Infinite loop? (p) => (p)
; Because each compound operator must be decomposed
; To primitive operators first.