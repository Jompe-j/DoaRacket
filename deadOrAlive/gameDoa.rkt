#lang racket

(require "isPersonDeadOrAlive.rkt")
(require "whatYear.rkt")
(require "whatDecade.rkt")
(require "personListEntry.rkt")

; Loop for game and turn.

(provide game-loop)

(define (turn-loop entry)
  (cons
   (is-person-dead-or-alive entry)
   (let
       ([correct-year? (what-year entry)])
     (list correct-year?
           (if (eq? correct-year? 0)
               (what-decade entry)
               null)))))
  


(define (game-loop lst playedList)
  (begin
    (if (>= (length playedList) 3)
        '()
        (let
            ([myValue (get-random-question-item lst)])
          (cons(turn-loop (cdr myValue))
               (game-loop (car myValue) (cons (cdr myValue)
                                              playedList)))))))
