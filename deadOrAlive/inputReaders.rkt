#lang racket

(provide string-reader)
(provide number-reader)

(define (string-reader)
  (string->symbol (string-trim (string-downcase (read-line)) "\r" #:right? #t)))

(define (number-reader)
  (string->number (string-trim (read-line) "\r" #:right? #t) 10 'number-or-false))
