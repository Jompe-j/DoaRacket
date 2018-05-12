#lang racket

(require "pickKInList.rkt")

(provide person-get-random-entry)
(provide person-name)
(provide person-data-state)
(provide person-data-year)

(define (person-get-random-entry played-list)
  (let
      ((new-item (pick-k (random (length arguably-dead)) arguably-dead)))
    (let
        ((try-if-new (lambda (input-played-list) ; Two parameters in to compare. Recursive compare between new value and first value in list until end.
                       (printf "~s\n" input-played-list))))
      (begin
        (try-if-new new-item)
        new-item))))

(define (person-name entry)
  (car entry))

(define (person-data-state entry)
  (pick-k 0 (cdr entry)))

(define (person-data-year entry)
  (pick-k 1 (cdr entry)))

(define arguably-dead
  '(("Hitler" . (dead 1945 Berlin))
    ("Moussolini" . (dead 1945  Giulino))
    ("Himmler" . (dead 1945 Lüneburg))
    ("Obama" . (alive 1961 Uganda))))

;; to be removed later
(define (testFunc input-list)
  (if (eq? (length input-list) 2)
      (begin
        ;(print input-list)
        input-list)
      (let
          ((mylist (cons (person-get-random-entry input-list) input-list )))
        (testFunc mylist))))


(define (testTest)
  (let
      ((testMyTest (testFunc '())))
    (begin
      ;(print (car (cdr testMyTest)))
      ;(print (car testMyTest))
      (cons testMyTest (person-get-random-entry '())))))