#lang racket
;(require net/http-client)(require json) (require "pickKInList.rkt")(require "personList.rkt")(require "printDecAlternatives.rkt") (require "randomList.rkt")
(require "isPersonDeadOrAlive.rkt")
(require "whatYear.rkt")
(require "whatDecade.rkt")
(require "personListEntry.rkt")

; Game entry point

(provide game-loop)

(define (start-turn entry)
  (cons (is-person-dead-or-alive entry)
        (let
            ((correct-year? (what-year entry)))
          (cons correct-year?
                (if (eq? correct-year? 0)
                    (what-decade entry)
                    null)))))
  
;; (displayln (string->jsexpr "{ \"qwe\": 123, \"zxc\": [ 4, 5, 6 ] }"))


(define (game-loop lst playedList)
  (if (>= (length playedList) 3)
      '()
      (let
          ((myValue (get-random-question-item lst)))
        (cons (start-turn (cdr myValue))
              (game-loop (car myValue)
                      (cons (cdr myValue)
                            playedList))))))

; Test stuff

; replacement for turn of game.
(define (testfunc inputstuff)
  (begin
    (printf "~s\n" inputstuff)
    4))

  