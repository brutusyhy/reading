#lang sicp
; Exercise 1.7: e good-enough? test used in computing square roots
; will not be very effective for finding the square roots of very small numbers.
; Also, in real computers, arithmetic operations are almost always performed with limited precision.
; is makes our test inadequate for very large numbers.
; Explain these statements, with examples showing how the test fails for small and large numbers.
; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration
; to the next and to stop when the change is a very small fraction of the guess.
; Design a square-root procedure that uses this kind of end test.
; Does this work beer for small and large numbers?
(define (abs x) (if (> x 0) x (- x)))
(define (square x) (* x x))
(define (avg x y) (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; If the number in question is very small, 0 would always be a valid answer
(good-enough? 0 0.000001)
; If the number in question is large, rounding error might accumulate and exceed the epsilon

(define (better-enough? old_guess new_guess)
  (< (abs (/ (- new_guess old_guess) old_guess)) 0.001));

(define (next guess x) (avg guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (better-enough? guess (next guess x))
    guess (sqrt-iter (next guess x) x)))

(sqrt-iter 1.0 2)

; This would work better for large and small numbers
; Since we are considering the proportion of changes