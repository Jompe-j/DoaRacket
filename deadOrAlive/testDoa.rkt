#lang racket
;(require net/http-client)(require json) (require "pickKInList.rkt")(require "personList.rkt")(require "printDecAlternatives.rkt") (require "randomList.rkt")
(require "isPersonDeadOrAlive.rkt")
(require "whatYear.rkt")
(require "whatDecade.rkt")
(require "personListEntry.rkt")
; Funderingar - Gör egna moduler per fråga? Blir väldigt nestat annars?
; Hur hanterar man att samma värde används flera gånger? Gör let? Spelar det roll?

; Game entry point

(provide start-turn)

(define (start-turn entry)
  (cons (is-person-dead-or-alive entry)
        (let
            ((correct-year? (what-year entry)))
          (cons correct-year?
                (if (eq? correct-year? 0)
                    (what-decade entry)
                    null)))))
  
;; (displayln (string->jsexpr "{ \"qwe\": 123, \"zxc\": [ 4, 5, 6 ] }"))

(define (play-game answered-questions)
  (if (eq? (length answered-questions) 4)
      '()
      (let
          ((question (person-get-random-entry answered-questions)))
        (cons (start-turn question)
              (play-game (cons question
                               answered-questions))))))


; Test stuff



  