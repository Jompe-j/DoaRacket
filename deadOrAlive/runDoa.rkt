#lang racket

(require "personListEntry.rkt")
(require "testDoa.rkt")
; (start-turn input-object) to run game.



; Alternativ 1 (erhåller inga poäng från spelet dock)
(define (remove-from-pos pos input-list)
  (if (eq? pos 0)
      (begin
        (start-turn (car input-list))
        (cdr input-list))
      (cons
       (car input-list)
       (remove-from-pos (- pos 1) (cdr input-list)))))

(define (play-number-of-times number-times input-list)
  (if (eq? number-times 0)
      '()
      (let
          ((unused-list (remove-from-pos (random (length input-list)) input-list)))
        (play-number-of-times (- number-times 1) unused-list))))



;(play-number-of-times 2 arguably-dead)

;; Alternativ 2

(define (test-game answered-questions)
  (if (eq? (length answered-questions) 4)
      '()
      (let
          ((question (get-random-question answered-questions)))
        (cons (start-turn question)
              (test-game (cons question
                               answered-questions))))))

(define (get-random-question answered-questions)
  (let
      ((new-question (person-get-random-entry answered-questions)))
    (begin
      (if (eq? (length answered-questions) 0)
          new-question
          (check-for-unique new-question answered-questions)))))

(define (check-for-unique question answered-questions)
  (if (eq? (length answered-questions) 0)
      question
      (if (eq? question (car answered-questions))
          (get-random-question answered-questions)
          (check-for-unique question (cdr answered-questions)))))