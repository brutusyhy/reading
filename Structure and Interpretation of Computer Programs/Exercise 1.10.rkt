#lang sicp
; Exercise 1.10: e following procedure computes a mathematical function called Ackermann’s function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; Evaluate
; (A 1 10)
(A 0 (A 1 9))
(* 2 (A 1 9))
(* 2 2 (A 1 8))
;... 2^9 * (A 1 1) => 2^10

; (A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 (A 0 (A 1 1))))
(A 1 (A 1 4))
(A 1 (A 0 (A 1 3)))
(A 1 (A 0 (A 0 (A 1 2))))
(A 1 (A 0 (A 0 (A 0 2))))
(A 1 16)
;=> 2^16

; (A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 4)
; 2^16

; Give concise mathematical definitions for
(define (f n) (A 0 n))
; f(n) = 2n
(define (g n) (A 1 n))
; g(n) = 2^n
(define (h n) (A 2 n))
; h(n) = 2^(n^2)