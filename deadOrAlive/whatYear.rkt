#lang racket
(require "listHandling.rkt")
(require "decadeFind.rkt")
(require "personListEntry.rkt")

(provide what-year)

;(what-year '() (lambda () 1945))

(define (what-year input-list input-reader)
  (let*
      ([is-dead-or-alive (person-data-state input-list)]
       [person-item (person-name input-list)]
       [verify-answer (lambda (fn)
                        (begin
                          (if (eq? is-dead-or-alive 'alive)
                              (printf "What year was ~a born?\n" person-item)
                              (printf "What year did ~a die?\n" person-item))
                          (let
                              ([answer (input-reader)])
                            (if (number? answer)
                                (if (eq? answer (person-data-year input-list))
                                    (begin
                                      (printf "Correct!\n")
                                      3)
                                    (begin
                                      (printf "Wrong!\n")
                                      0))
                                (begin
                                  (printf "Invalid input\n")
                                  (fn fn))))))])
    (verify-answer verify-answer)))