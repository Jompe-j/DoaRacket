#lang racket

(require "pickKInList.rkt")

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
  '(("Adolf Hitler" . (dead 1945 Berlin))
    ("Benito Moussolini" . (dead 1945  Giulino))
    ("Heinrich Himmler" . (dead 1945 Lüneburg))
    ("Barack Obama" . (alive 1961 Honolulu))
    ("Vladimir Putin" . (alive 1952 Leningrad))))


(define (get-random-question-item lst)
  (remove-acc (random (length lst)) lst '()))

(define (remove-acc pos lst acc)
  (if (<= pos 0)
      (cons
       (copy-acc (cdr lst) acc)
       (car lst))
      (remove-acc (- pos 1) (cdr lst)
                  (cons
                   (car lst)
                   acc))))

(define (copy-acc lst acc)
  (if (eq? lst '())
      acc
      (copy-acc (cdr lst)
                (cons
                 (car lst)
                 acc))))

