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
; Funderingar - Gör egna moduler per fråga? Blir väldigt nestat annars?
; Hur hanterar man att samma värde används flera gånger? Gör let? Spelar det roll?

; Game entry point
(define (start)
  ; Pick random item from list of persons
  ; should randomize a list instead.
  
  (let
      ((most-certainly-almost-dead (pick-k (random (length (person-list))) (person-list))))
    ; Multiple uses
    
    (let
        ((random-doa-item (car most-certainly-almost-dead)))
      (begin
        (is-person-dead-or-alive most-certainly-almost-dead)
        (let
            ((correct-year? (what-year most-certainly-almost-dead)))
        (if (eq? correct-year? #t)
          (my-score)
          (what-decade most-certainly-almost-dead)))))))


(define (my-score)
  (print "\n Du fick poäng"))




;(define arguably-dead
;  '(("Hitler" . (dead 1945 Berlin))
;    ("Moussolini" . (dead 1945  Giulino))
;    ("Himmler" . (dead 1945 Lüneburg))))



;; (displayln (string->jsexpr "{ \"qwe\": 123, \"zxc\": [ 4, 5, 6 ] }"))

;(define (what-year input-list)
;  (begin
;    (printf "What year did ~a die?" (car input-list))
;    (let
;        ((answer2 (read)))
;      (if (eq? answer2 (pick-k 1 (cdr input-list)))
;          (print "Correct.")
;          (begin
;            (let
;                ((decade-alternatives (decade-find (pick-k 1 (cdr input-list)))))
;              (print "no!")
;              (print-dec-alternatives decade-alternatives)
;              (printf "What decade did ~a die?" (car input-list))
;              (let
;                  ((answer3 (read)))
;                (print (pick-k 1 (cdr input-list)))
;                (print answer3))))))))

;(define (decade-find input-year)
;             (let
;                 ((decade (lambda (x)
;                            (* (quotient x 10) 10))))
;               ;; If decade is same as input-year decade, then true. else false. 
;               (let
;                   ((same-decade? (lambda (x y)
;                                    (if (eq? (decade x) (decade y))
;                                        #t
;                                        #f))))
;                 ;; Snyggare sätt att hantera boolen?
;                 (list
;                  (list (decade (-
;                                 input-year
;                                 5))
;                        (same-decade? input-year (- input-year 5)))
;                  (list (decade (+
;                                 input-year
;                                 5))
;                        (same-decade? input-year (+ input-year 5)))))))

(start)
