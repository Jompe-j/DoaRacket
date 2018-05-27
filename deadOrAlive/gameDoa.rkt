#lang racket

(require "isPersonDeadOrAlive.rkt")
(require "whatYear.rkt")
(require "whatDecade.rkt")
(require "personListEntry.rkt")
(require "inputReaders.rkt")

; Loop for game and turn.

(provide game-loop)

(define (game-loop lst playedList)
  (if (>= (length playedList) 3)
      '()
      (let
          ([myValue (get-random-question-item lst)])
        (cons (turn-loop (cdr myValue))
              (game-loop (car myValue) (cons (cdr myValue)
                                             playedList))))))

(define (turn-loop entry)
  (cons (is-person-dead-or-alive entry string-reader)
        (let
            ([correct-year? (what-year entry number-reader)])
          (list correct-year? (if (eq? correct-year? 0)
                                  (what-decade entry number-reader)
                                  null)))))
  



