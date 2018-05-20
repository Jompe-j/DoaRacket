#lang racket


(define (pick-k k lst)
  (if (eq? k 0)
      (car lst)
      (pick-k (- k 1) (cdr lst))))