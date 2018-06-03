#lang racket

(provide remove-item)
(provide pick-k)

; Remove item from list. Returns '(list-with-one-item-removed item-removed)
(define (remove-item pos lst acc)
  (if (<= pos 0)
      (cons (copy-rest (cdr lst) acc)
            (car lst))
      (remove-item (- pos 1) (cdr lst)
                   (cons (car lst)
                         acc))))

; Copy the rest of the list
(define (copy-rest lst acc)
  (if (eq? lst '())
      acc
      (copy-rest (cdr lst)
                 (cons (car lst)
                       acc))))


; Find element in position k in list.
(define (pick-k k lst)
  (if (eq? k 0)
      (car lst)
      (pick-k (- k 1) (cdr lst))))