#lang racket
(define (century-select input-year)
  (let
      ((cent (lambda (x)
               (*
                (modulo
                 (quotient
                  x
                  10)
                 10)
                10))))
    (list
     (cent (-
            input-year
            5))
     (cent (+
            input-year
            5)))))


; How to handle if input generates 00. 2001 + 5 = 2006


; Shortform for define, example.
;; (define wqe (lambda (x y) (+ x y)))
