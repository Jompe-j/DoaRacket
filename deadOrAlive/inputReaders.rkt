#lang racket

(provide string-reader)
(provide number-reader)

(define (string-reader)
  (string->symbol (string-downcase (read-line))))

(define (number-reader)
  (string->number (read-line) 10 'number-or-false))
