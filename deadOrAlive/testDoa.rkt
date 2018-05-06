#lang racket
(require net/http-client)
(require json)

(define (start)  
 (let
     ((most-certainly-almost-dead (pick-k (random (length arguably-dead)) arguably-dead)))
   (begin    
     (println (car most-certainly-almost-dead))         
     (let
         ((answer (read)))
       (if (eq? answer (car (cdr most-certainly-almost-dead)))
           (print "Correct!")
           (print "Nob."))))))

(define (pick-k k lst)
 (if (eq? k 0)
     (car lst)
     (pick-k (- k 1) (cdr lst))))


(define arguably-dead
 '(("Hitler" yes)
   ("Moussolini" yes)))




(displayln (string->jsexpr "{ \"qwe\": 123, \"zxc\": [ 4, 5, 6 ] }"))



(start)