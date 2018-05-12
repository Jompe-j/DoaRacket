#lang racket
(require net/http-client)
(require json)
(require "pickKInList.rkt")
(require "decadeFind.rkt") ; for debugging
(require "personList.rkt")
(require "isPersonDeadOrAlive.rkt")
(require "whatYear.rkt")
(require "whatDecade.rkt")
(require "printDecAlternatives.rkt") ; for debuggin of what-year
(require "randomList.rkt")
; Funderingar - Gör egna moduler per fråga? Blir väldigt nestat annars?
; Hur hanterar man att samma värde används flera gånger? Gör let? Spelar det roll?

; Game entry point
(define (start)
  ; Pick random item from list of persons
  ; should randomize a list instead.
  
  (let
      ((most-certainly-almost-dead (pick-k (random (length (person-list))) (person-list))))
   
      (begin
        ;experiment - gör inte så. Consa in i tom lista. Vad consas in i listan?
        
        (let
            ((list-of-doa (random-list)))
        (for ((i list-of-doa))
          (printf "~s\n" i))
          ; end of experiment
        (is-person-dead-or-alive most-certainly-almost-dead)
        (let
            ((correct-year? (what-year most-certainly-almost-dead)))
        (if (eq? correct-year? #t)
          (print "Rätt")
          (what-decade most-certainly-almost-dead))
          (my-score))))))

; starta med en tom lista, consa in 


(define (my-score)
  (print "\n Du fick poäng"))


;; (displayln (string->jsexpr "{ \"qwe\": 123, \"zxc\": [ 4, 5, 6 ] }"))

(start)
