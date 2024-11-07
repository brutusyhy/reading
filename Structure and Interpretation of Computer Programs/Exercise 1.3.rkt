#lang sicp
(define (<= x y) (or (< x y) (= x y)))
(define (square x) (* x x))

(define (sum-of-larger-squares x y z)
  (cond ((and (<= x y) (<= x z))
         (+ (square y) (square z)))
        ((and (<= y x) (<= y z))
         (+ (square x) (square z)))
        (else (+ (square x) (square y)))))