#lang racket
;(require net/http-client)
;(require json)
;(require "pickKInList.rkt")
;(require "decadeFind.rkt") ; for debugging
;(require "personList.rkt")
(require "isPersonDeadOrAlive.rkt")
(require "whatYear.rkt")
(require "whatDecade.rkt")
;(require "printDecAlternatives.rkt") ; for debuggin of what-year
;(require "randomList.rkt")
(require "personListEntry.rkt")
; Funderingar - Gör egna moduler per fråga? Blir väldigt nestat annars?
; Hur hanterar man att samma värde används flera gånger? Gör let? Spelar det roll?

; Game entry point

;(provide start-turn)
(define (start-turn entry)
  (begin
    (is-person-dead-or-alive entry)
    (if (eq? (what-year entry) 0)
        (what-decade entry)
        (print "Rätt")) ; Hur gör jag ingenting?
    5)); should be points.

; starta med en tom lista, consa in 

(define (start-turn1 entry)
  (cons (is-person-dead-or-alive entry)
        (let
            ((correct-year? (what-year entry)))
          (cons correct-year?
                (if (eq? correct-year? 0)
                     (what-decade entry)
                     null)))))
  


;; (displayln (string->jsexpr "{ \"qwe\": 123, \"zxc\": [ 4, 5, 6 ] }"))

;(start)

;Test to start with random entry.
; IT'S ALIVE!!!
(define (play-game answered-questions)
  (if (eq? (length answered-questions) 1)
      '()
      (let
          ((question (person-get-random-entry answered-questions)))
        (cons (start-turn1 question)
              (play-game (cons question
                               answered-questions))))))