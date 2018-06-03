#lang racket

(require "isPersonDeadOrAlive.rkt")
(require "whatYear.rkt")
(require "whatDecade.rkt")
(require "personListEntry.rkt")
(require "inputReaders.rkt")

; Loop for game and turn.

(provide game-loop)

; Game-loop builds a score list of the lists from from each completed turn-loop.
; Returns the score list
(define (game-loop lst playedList)
  (if (>= (length playedList) 3)
      '()
      (let
          ([myValue (get-random-question-item lst)])
        (cons (turn-loop (cdr myValue))
              (game-loop (car myValue) (cons (cdr myValue)
                                             playedList))))))

; Turn-loop iterates over entry object and calls functions to ask questions.
; Function recursively build a score list for each entry object passed to each question.
(define (turn-loop entry)
  (cons (is-person-dead-or-alive entry string-reader)
        (let
            ([correct-year? (what-year entry number-reader)])
          (list correct-year? (if (eq? correct-year? 0)
                                  (what-decade entry number-reader)
                                  null)))))
  



