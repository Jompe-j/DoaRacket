#lang racket
(require "pickKInList.rkt")
(require "decadeFind.rkt")
(require "printDecAlternatives.rkt")

(provide what-decade)

(define (what-decade input-list)
(let
    ((is-dead-or-alive (pick-k 0 (cdr input-list))))
  (let
      ((person-item (car input-list)))
  (begin
    (if (eq? is-dead-or-alive 'alive)
        (printf "What decade was ~s born?" person-item)
        (printf "What decade did ~s die?" person-item))
     
    (let
        ((decade-alternatives (decade-find (pick-k 1 (cdr input-list)))))
      (print-dec-alternatives decade-alternatives)
      (begin
        (let
            ((answer (read)))
          (if (eq? answer (find-correct-dec decade-alternatives))
              (begin
                (print "yes")
               2)
              (begin
              (print "no!")
              0)))))))))
          ;(find-correct-dec decade-alternatives))))))))

(define my-list
  '("Hitler" . (alive 1941 Berli)))

(define (find-correct-dec input-dec-alternatives)
  (begin
    
    ;(print (car (cdr (car input-dec-alternatives))))
    ;(print (car (cdr input-dec-alternatives)))
   ; (print(car(cdr (car input-dec-alternatives))))
    (if (eq? (car (cdr (car input-dec-alternatives))) #t)
        (car (car input-dec-alternatives))
        (find-correct-dec (cdr input-dec-alternatives)))))