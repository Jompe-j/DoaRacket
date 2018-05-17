#lang racket

(require "personListEntry.rkt")
(require "testDoa.rkt")
(require "isPersonDeadOralive.rkt")

; (start-turn input-object) to run game.



; Alternativ 1 (erhåller inga poäng från spelet dock)
(define (remove-from-pos pos input-list)
  (if (eq? pos 0)
      (begin
        ; (print (start-turn (car input-list))
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
(remove-from-pos 2 arguably-dead)

;; Alternativ 2
(define (test-test-game inputstuff)
  (is-person-dead-or-alive inputstuff))

(define (test-game answered-questions)
  (if (eq? (length answered-questions) 4)
      '()
      (let
          ((question (get-random-question answered-questions)))
        (cons (test-test-game question)
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
  (begin
    (printf "letar unika saker\n")
    (printf "question ~s" question)
    (printf "answered q ~s\n" answered-questions)
    (if (eq? (length answered-questions) 0)
        question
        (if (eq? question (car answered-questions))
            (get-random-question answered-questions)
            (check-for-unique question (cdr answered-questions))))))

;; Third example - not implemented in game.
(define (remove pos input-list)
  (if (<= pos 0)
      (cdr input-list)
      (cons
       (car input-list)
       (remove (- pos 1) (cdr input-list)))))

(define (pick pos input-list)
  (if (<= pos 0)
      (car input-list)
      (pick (- pos 1) (cdr input-list))))

(define (shuffle input-list)
  (if (eq? input-list '())
      '()
      (let* ([list-length (length input-list)]
             [random-pos (random (length input-list))])
        (cons (pick random-pos input-list)
              (shuffle (remove random-pos input-list))))))

(define myList
  '(a b c d e f g h i))

(shuffle myList)
             
;; Fourth example - not implemented in game.

(define (shuffle2 input-list)
  (shuffle-acc input-list (length input-list) '()))

(define (shuffle-acc input-list list-length acc)
  (if (eq? input-list '())
      acc
      (let ([random-pos (random list-length)])
        (shuffle-acc (remove random-pos input-list)
                     (- list-length 1)
                     (cons (pick random-pos input-list)
                           acc)))))

(shuffle2 myList)

                                 