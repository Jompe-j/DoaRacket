#lang racket
(require "pickKInList.rkt")
(require "decadeFind.rkt")
(require "printDecAlternatives.rkt")

(provide what-year)

(define (what-year input-list)
  (begin
    (printf "What year did ~a die?" (car input-list))
    (let
        ((answer2 (read)))
      (if (eq? answer2 (pick-k 1 (cdr input-list)))
          (begin
            (print "Correct.")
            #t)
          (begin
           (print "Wrong")
           #f)))))
