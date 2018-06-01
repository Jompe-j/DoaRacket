#lang racket

(require rackunit)
(require "../deadOrAlive/isPersonDeadOrAlive.rkt")

; Testcases
;; Invalid answer
(define (invalid-input)
  "44")

;; Wrong answer
(define (valid-wrong-input)
  'alive)

;; Right answer
(define (valid-correct-input)
  'dead)

(define lst
  '("Nomen Nescio" dead))

; Tests return void if passed.
(test-begin
(check-eq? (is-person-dead-or-alive lst invalid-input) 0)

(check-eq? (is-person-dead-or-alive lst valid-wrong-input) 0)

(check-eq? (is-person-dead-or-alive lst valid-correct-input) 2))

