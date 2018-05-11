#lang racket
(require "pickKInList.rkt")
(provide is-person-dead-or-alive)

(define (is-person-dead-or-alive input-list)
  (begin
    (printf "Is ~a dead or alive ?" (car input-list))
    (let
        ((answer (read)))
      (if (eq? answer (pick-k 0 (cdr input-list)))
          (print "Correct!")
          (print "Nob.")))))