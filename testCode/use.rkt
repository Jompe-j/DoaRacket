#lang racket
(require "quick.rkt")
(require slideshow)
(require slideshow/code)
(rainbow (square 5))

(define-syntax pict+code
  (syntax-rules ()
    [(pict+code expr)
     (hc-append 10
                expr
                (code expr))]))

; (pict+code (circle 10))