#lang racket
(require "listHandling.rkt")
(provide is-person-dead-or-alive)

(define (is-person-dead-or-alive input-list)
  (begin
    (printf "Is ~a dead or alive?\n" (car input-list))
    (let
        ([answer (read)])
      (if (eq? answer (pick-k 0 (cdr input-list)))
          (begin
            (printf "Correct!\n")
            2)
          (begin
            (printf "Wrong!\n")
            0)))))