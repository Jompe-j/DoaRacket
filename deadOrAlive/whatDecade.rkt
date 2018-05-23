#lang racket
(require "listHandling.rkt")
(require "decadeFind.rkt")
(require "printDecAlternatives.rkt")

(provide what-decade)

(define (what-decade input-list)
  (let
      ([is-dead-or-alive (pick-k 0 (cdr input-list))]
       [person-item (car input-list)]
       [decade-alternatives (decade-find (pick-k 1 (cdr input-list)))])
    (begin
      (if (eq? is-dead-or-alive 'alive)
          (printf "What decade was ~s born?\n" person-item)
          (printf "What decade did ~s die?\n" person-item))
        (print-dec-alternatives decade-alternatives)
        (begin
          (let
              ([answer (read)])
            (if (eq? answer (find-correct-dec decade-alternatives))
                (begin
                  (printf "yes\n")
                  2)
                (begin
                  (printf "no!\n")
                  0)))))))

(define (find-correct-dec input-dec-alternatives)
  (begin
    (if (eq? (cadar input-dec-alternatives) #t)
        (car (car input-dec-alternatives))
        (find-correct-dec (cdr input-dec-alternatives)))))

(define (print-dec-alternatives input-alternatives-list)
  (let
      ([print-alternatives (lambda (lst fn)
                             (if (eq? lst '())
                                 '()
                                 (begin
                                   (printf "~s\n" (caar lst))
                                   (fn (cdr lst) fn))))])
    (begin
      (printf "Choose from either of:\n")
      (print-alternatives input-alternatives-list print-alternatives))))