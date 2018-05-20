#lang racket
(require "listHandling.rkt")

(provide person-name)
(provide person-data-state)
(provide person-data-year)
(provide arguably-dead)
(provide get-random-question-item)

(define (person-name entry)
  (car entry))

(define (person-data-state entry)
  (pick-k 0 (cdr entry)))

(define (person-data-year entry)
  (pick-k 1 (cdr entry)))

(define arguably-dead
  '(("Adolf Hitler" . (dead 1945 "Berlin" "Germany"))
    ("Benito Moussolini" . (dead 1945  "Giulino" "Italy"))
    ("Heinrich Himmler" . (dead 1945 "Lüneburg" "Germany"))
    ("Barack Obama" . (alive 1961 "Honolulu" "USA"))
    ("Vladimir Putin" . (alive 1952 "Leningrad (Saint Petersburg)" "Russia"))
    ("Kirk Douglas" . (alive 1916 "Amsterdam (New York)" "USA"))
    ("Betty White" . (alive 1922 "Oak Park" "USA"))
    (


(define (get-random-question-item lst)
  (remove-item (random (length lst)) lst '()))



