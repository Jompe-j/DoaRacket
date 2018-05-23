#lang racket

(require rackunit)

(define (double-input a)
  (+ a 1))

;(check-eq? (double-input 1) 3)

(define (my-read)
  (let
      ([user-answer (lambda (fn)
                      (let
                          ([input-datum (string->symbol (string-downcase (read-line)))])
                            (eq? input-datum '||)
                                (or (in-list? input-datum '(alive dead)))
                            (fn fn)
                            input-datum)))])
    (user-answer user-answer)))

(define (in-list? user-input lst)
  (if (eq? lst '())
      #f
      (if (eq? (car lst) user-input)
          #t
          (in-list? user-input (cdr lst)))))
      


(define (inputstuff)
  (let
      ([stuff (read-line)])
    (string->symbol (string-downcase stuff))))


(define (read-state)
  (let
      ([my-input (read-line)])
    (if (eof-object? my-input)
        (begin
          (print "Skrevdu inget?")
          (exit))
        (let
            ([sym (string->symbol (string-downcase my-input))])
          (if (list? (member sym '(alive dead)))
              sym
              (begin
                (printf "Felaktig inmatning!")
                (read-state)))))))
