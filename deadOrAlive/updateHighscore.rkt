#lang racket

(require "listHandling.rkt")
(provide update-highscore)
(provide setup-highscore-file)

(define (update-highscore input-name-score)
  (let
      ([highscore-lst (read-highscore)])
    (if (<= (length highscore-lst) 4)
        (write-highscore (cons
                          input-name-score
                          highscore-lst))
        (write-highscore (insert-new-highscore highscore-lst input-name-score)))))

(define (write-highscore highscore-lst)
  (let
      ([f (open-output-file "highscore.txt" #:mode 'text #:exists 'replace)])
    (begin
      (displayln highscore-lst f)    
      (close-output-port f))))

(define (read-highscore)
  (let ([r (open-input-file "highscore.txt" #:mode 'text)])
    (begin
      (let
          ([file-content (read r)])
        (close-input-port r)
        file-content))))

; String to test function.
(define teststring
  '((bosa 19) (grejs 18) (Assa 2) (du 5)))

; Function to get smallest or larges value in toplist
; (find-pos lst '(name 0 -1) -1)
(define (find-pos lst list-name-value-position pos high-low?)
  (begin
    (if (<= (length lst) 0)
        list-name-value-position
        (let
            ([myName (car (car lst))]
             [myVal (car (cdr (car lst)))]
             [myPos (+ pos 1)])
          (if (or
               (eq? (car (cdr list-name-value-position)) 0)
               (high-low? myVal (car (cdr list-name-value-position))))
              (find-pos (cdr lst) (list myName myVal myPos) myPos high-low?)
              (find-pos (cdr lst) list-name-value-position myPos high-low?))))))

(define (insert-new-highscore lst new-highscore)
  (cons
   new-highscore
   (car (remove-item (car (cdr (cdr (find-pos lst '(name 0 -1) -1 <)))) lst '()))))

(define (highscore-order lst)
  (

(define (setup-highscore-file)
  (when (not (file-exists? "highscore.txt"))
    (write-highscore '())))



(define (print-highscore)
  (let*
      ([highscore-lst (read-highscore)]
       [print-loop (lambda (highscore-lst fn)
                     (if (eq? highscore-lst '())
                         '()
                         (begin
                           (let
                               ([
                         (printf "~s\n" (car highscore-lst))
                         (fn (cdr highscore-lst) fn))))])
        (print-loop highscore-lst print-loop)))

Om nästa värde är mindre än det jag stoppar in.