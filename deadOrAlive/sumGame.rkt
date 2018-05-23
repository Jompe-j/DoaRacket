#lang racket

(provide sum-points)

(define (sum-points lst)
  (add-lst (traverse lst 0) 0))

(define (traverse lst acc)
  (if (<= (length lst) 0)
      null
      (let
          ([points (add-lst (car lst) acc)])
        (cons points
              (traverse (cdr lst) 0)))))

(define (add-lst lst acc)
  (let
      ([add-q-score (lambda (point acc)
                      (+ point acc))])
    (if (<= (length lst) 0)
        acc
        (if (number? (car lst))
            (add-lst (cdr lst) (add-q-score (car lst) acc))
            (add-lst (cdr lst) acc)))))
