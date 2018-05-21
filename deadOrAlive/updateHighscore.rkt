#lang racket

(require "listHandling.rkt")
(provide update-highscore)
(provide setup-highscore-file)

(define (update-highscore player-highscore)
  (write-highscore (insert-highscore(read-highscore) player-highscore 5))) 

(define (insert-highscore highscore-lst input-lst max-length)
  (let
      ([copy-rest (lambda (lst max-len fn)
                    (cond
                      [(<= max-len 0) '()]
                      [(null? lst) '()]
                      [else (cons (car lst)
                                  (fn (cdr lst) (- max-len 1) fn))]))])
    (cond
      [(<= max-length 0) '()]
      [(null? highscore-lst) (list input-lst)]
      [(< (cadar highscore-lst) (cadr input-lst))
       (cons input-lst
             (copy-rest highscore-lst (- max-length 1) copy-rest))]
      [else (cons (car highscore-lst)
                  (insert-highscore (cdr highscore-lst) input-lst (- max-length 1)))])))

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
  '((bosa 19) (grejs 18) (du 5) (Assa 2)))


(define (setup-highscore-file)
  (when (not (file-exists? "highscore.txt"))
    (write-highscore '())))
