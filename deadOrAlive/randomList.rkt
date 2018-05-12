#lang racket
; Fischer yates shuffle. Converting list to vector and back again.

(provide random-list)

(define (shuffle x)
  (do ((v (list->vector x)) (n (length x) (- n 1)))
    ((zero? n) (vector->list v))
    (let* ((r (random n)) (t (vector-ref v r)))
      (vector-set! v r (vector-ref v (- n 1)))
      (vector-set! v (- n 1) t))))


(define person-list
  '(("Hitler" . (dead 1945 Berlin))
    ("Moussolini" . (dead 1945  Giulino))
    ("Himmler" . (dead 1945 Lüneburg))
    ("Obama" . (alive 1961 Uganda))))

(define (random-list)
  (shuffle person-list))
