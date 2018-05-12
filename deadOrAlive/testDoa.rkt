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

(provide start-turn)
(define (start-turn entry)
      (begin
        (is-person-dead-or-alive entry)
        (let
            ((correct-year? (what-year entry)))
        (if (eq? correct-year? #t)
          (print "Rätt")
          (what-decade entry))
          (my-score))))

; starta med en tom lista, consa in 


(define (my-score)
  (print "\n Du fick poäng"))


;; (displayln (string->jsexpr "{ \"qwe\": 123, \"zxc\": [ 4, 5, 6 ] }"))

;(start)

;Test to start with random entry.
(define (entry-item)
  (let
      ((entry-row ( person-get-random-entry)))
  (start-turn entry-row)))