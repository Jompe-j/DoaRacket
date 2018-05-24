#lang racket

(require rackunit)
(require "../deadOrAlive/whatYear.rkt")

;Testcases
;; Wrong answer
(define (valid-wrong-input)
  1930)

;; Right answer
(define (valid-correct-input)
  1945)

(define lst
  '("Nomen Nescio" dead 1945))

(check-eq? (what-year lst valid-wrong-input) 0)

(check-eq? (what-year lst valid-correct-input) 3)