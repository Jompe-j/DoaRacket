#lang racket

(require "personListEntry.rkt")
(require "testDoa.rkt")


(define (game-points lst player-points)
  (let
      ([myAdd (lambda (a b)
                (+ a b))])
    (if (<= (length lst) 0)
        '()
        (begin
          (printf "list: ~s\n" player-points)
          (game-points (cdr lst) (myAdd (car lst) player-points))))))


; (game-loop arguably-dead '())


(define myPoints
  '(1 2 3 (4 5 (6 7 8 (9 10) 11) 12) 13 14 ((15 16) 17 18) 19 20))

(define (traverse lst)
  (if (<= (length lst) 0)
      '()
      (begin
        (printf "~s\n" lst)
        (printf "~s\n" (cdr lst))
        (printf "~s\n" (car lst))
        (if (list? (cdr lst))
            (traverse (cdr lst))
            (begin
              ;(printf "~s\n" (car lst))
              (traverse (cdr lst)))))))

(define (traverse2 lst)
  (if (<= (length lst) 0)
      '()
      (begin
        (printf "~s\n" (car lst))
        (traverse2 (cdr lst)))))