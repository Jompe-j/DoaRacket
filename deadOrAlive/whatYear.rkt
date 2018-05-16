#lang racket
(require "pickKInList.rkt")
(require "decadeFind.rkt")
(require "printDecAlternatives.rkt")

(provide what-year)

(define (what-year input-list)
(let
    ((is-dead-or-alive (pick-k 0 (cdr input-list))))
  (let
      ((person-item (car input-list)))
  (begin
    (if (eq? is-dead-or-alive 'alive)
        (printf "What year was ~s born?" person-item)
        (printf "What year did ~s die?" person-item))
    (let
        ((answer2 (read)))
      (if (eq? answer2 (pick-k 1 (cdr input-list)))
          (begin
            (print "Correct.")
            5)
          (begin
           (print "Wrong")
           0)))))))
