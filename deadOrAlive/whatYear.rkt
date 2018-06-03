#lang racket
(require "listHandling.rkt")
(require "personListEntry.rkt")

(provide what-year)

; Ask what year person was born/died. Takes user input and returns score.
(define (what-year input-list input-reader)
  (let*
      ([is-dead-or-alive (person-data-state input-list)]
       [person-item (person-name input-list)]
       [verify-answer (lambda (fn i)
                        (begin
                          (if (eq? is-dead-or-alive 'alive)
                              (printf "What year was ~a born?\n" person-item)
                              (printf "What year did ~a die?\n" person-item))
                          (let
                              ([answer (input-reader)])
                            (if (or (number? answer)
                                    (>= i 2))
                                (if (eq? answer (person-data-year input-list))
                                    (begin
                                      (printf "Correct!\n")
                                      3)
                                    (begin
                                      (printf "Wrong!\n")
                                      0))
                                (begin
                                  (printf "Invalid input\n")
                                  (fn fn (+ i 1)))))))])
    (verify-answer verify-answer 0)))