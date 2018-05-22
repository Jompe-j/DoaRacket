#lang racket
(require "listHandling.rkt")
(require "decadeFind.rkt")
(require "printDecAlternatives.rkt")
(require "personListEntry.rkt")

(provide what-year)

(define (what-year input-list)
  (let
      ([is-dead-or-alive (person-data-state input-list)])
    (let
        ([person-item (person-name input-list)])
      (begin
        (if (eq? is-dead-or-alive 'alive)
            (printf "What year was ~s born?\n" person-item)
            (printf "What year did ~s die?\n" person-item))
        (let
            ([answer2 (read)])
          (if (eq? answer2 (person-data-year input-list))
              (begin
                (printf "Correct.\n")
                3)
              (begin
                (printf "Wrong\n")
                0)))))))
