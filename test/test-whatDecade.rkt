#lang racket

(require rackunit)
(require "../deadOrAlive/whatDecade.rkt")

;Testcases
;; Invalid answer
(define (invalid-input)
  "1930")

;; Wrong but Valid
(define (valid-wrong-input)
  1930)

;; Right answer
(define (valid-correct-input)
  1940)

(define lst
  '("Nomen Nescio" dead 1941))

(define lst2
  '("Nomen Nescio" dead 1949))

; Tests return void if passed
;; what-decade
(test-begin
 (check-eq? (what-decade lst invalid-input) 0)

 (check-eq? (what-decade lst valid-wrong-input) 0)

 (check-eq? (what-decade lst2 valid-wrong-input) 0)

 (check-eq? (what-decade lst valid-correct-input) 2)

 (check-eq? (what-decade lst2 valid-correct-input) 2))
