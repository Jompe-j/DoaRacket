#lang racket

(provide string-reader)
(provide number-reader)

; Read string input. Trim for issue with windows \r in console.
(define (string-reader)
  (string->symbol (string-trim (string-downcase (read-line)) "\r" #:right? #t)))

; Read number input. Trim for issue with windows \r in console.
(define (number-reader)
  (string->number (string-trim (read-line) "\r" #:right? #t) 10 'number-or-false))
