#lang racket

(require "pickKInList.rkt")

(provide person-get-random-entry)
(provide person-name)
(provide person-data-state)
(provide person-data-year)
(provide arguably-dead)

(define (person-get-random-entry played-list)
  (let
      ((new-item (pick-k (random (length arguably-dead)) arguably-dead)))
    (let
        ((try-if-new (lambda (input-played-list) ; Two parameters in to compare. Recursive compare between new value and first value in list until end.
                       (printf "~s\n" input-played-list))))
      (begin
        ;(try-if-new new-item)
        new-item))))

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

; Testfunction

; '(("Adolf Hitler" dead 1945 Berlin) ("Benito Moussolini" dead 1945 Giulino) "Heinrich Himmler" dead 1945 Lüneburg) List of 3 different
(define (testGet inputList)
  (let
      ((newItem (pick-k (random (length arguably-dead)) arguably-dead)))
    (begin
      (printf "start\n ~s\n" newItem)
      (printf "~s\n\n" inputList)
      (if (testOnlyOnce newItem inputList)
          (printf "new line! ~s \n" newItem)
          (testGet inputList)))))

(define (testOnlyOnce newItem inputList)
  (begin
    (if (eq? (length inputList) 0)
        #t
        (begin
          (printf "Length: ~s\n" (length inputList))
          (printf "InputList: ~s\n" inputList)
        (if (eq? newItem (car inputList))
            #f
            (testOnlyOnce newItem (cdr inputList)))))))