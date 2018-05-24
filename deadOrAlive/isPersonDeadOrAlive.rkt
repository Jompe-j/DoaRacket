#lang racket
(require "listHandling.rkt")
(require "inputReaders.rkt")
(require "personListEntry.rkt")
(provide is-person-dead-or-alive)

(define (is-person-dead-or-alive input-list input-reader)
  (let*
      ([person-item (car input-list)]
       [verify-answer (lambda (fn i)
                          (printf "Is ~a dead or alive?\n" (car input-list))
                          (let
                              ([answer (input-reader)])
                            (if (or (member answer '(dead alive))
                                    (>= i 2))
                                (if (eq? answer (person-data-state input-list))
                                    (begin
                                      (printf "Correct\n")
                                      2)
                                    (begin
                                      (printf "Wrong\n")
                                      0))
                                (begin
                                  (printf "Invalid input!\n")
                                  (fn fn (+ i 1))))))])
    (verify-answer verify-answer 0)))

