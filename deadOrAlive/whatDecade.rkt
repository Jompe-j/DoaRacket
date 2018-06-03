#lang racket
(require "personListEntry.rkt")

(provide what-decade)

; Ask what decade person was born / died. Take user input and return score.
(define (what-decade lst input-reader)
  (let*
      ([is-dead-or-alive (person-data-state lst)]
       [person-item (car lst)]
       [decade-alternatives (decade-find (person-data-year lst))]
       [verify-answer (lambda (fn i)
                        (if (eq? is-dead-or-alive 'alive)
                            (printf "What decade was ~a born?\n" person-item)
                            (printf "What decade did ~a die?\n" person-item))
                        (print-dec-alternatives decade-alternatives)
                        (let
                            ([answer (input-reader)])
                          (if (or (number? answer)
                                  (>= i 2))
                              (if (eq? answer (find-correct-dec decade-alternatives))
                                  (begin
                                    (printf "Correct!\n")
                                    2)
                                  (begin
                                    (printf "Wrong!\n")
                                    0))
                              (begin
                                (printf "Invalid input\n")
                                (fn fn (+ i 1))))))])
    (verify-answer verify-answer 0)))
                           

; Set correct decade based on year of birth/death.
(define (find-correct-dec input-dec-alternatives)
  (begin
    (if (eq? (cadar input-dec-alternatives) #t)
        (caar input-dec-alternatives)
        (find-correct-dec (cdr input-dec-alternatives)))))

; Print the decade alternatives available. 
(define (print-dec-alternatives input-lst)
  (let
      ([print-alternatives (lambda (lst fn)
                             (if (eq? lst '())
                                 '()
                                 (begin
                                   (printf "~s\n" (caar lst))
                                   (fn (cdr lst) fn))))])
    (printf "Choose from either of:\n")
    (print-alternatives input-lst print-alternatives)))

; Generates decade from year of birth/death
(define (decade-find input-year)
  (let*
      ([decade (lambda (x)
                 (* (quotient x 10) 10))]
       [same-decade? (lambda (x y)
                       (if (eq? (decade x) (decade y))
                           #t
                           #f))])
    (list
     (list (decade (-
                    input-year
                    5))
           (same-decade? input-year (- input-year 5)))
     (list (decade (+
                    input-year
                    5))
           (same-decade? input-year (+ input-year 5))))))