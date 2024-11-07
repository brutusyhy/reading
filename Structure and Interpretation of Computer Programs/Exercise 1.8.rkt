#lang sicp
; Newton’s method for cube roots is based on the fact that
; if y is an approximation to the cube root of x,
; then a beer approximation is given by the value

(define (next y x)
  (/ (+
    (/ x (square y))
    (* 2 y))
   3.0))
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (abs x) (if (> x 0) x (- x)))
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (root-iter guess x)
  (if (good-enough? guess x)
      guess
      (root-iter (next guess x) x)))

(root-iter 1 8)