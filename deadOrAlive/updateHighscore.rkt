#lang racket

(require "listHandling.rkt")
(require "gameSettings.rkt")

(provide save-points)
(provide setup-highscore-file)
(provide print-highscore)
(provide read-highscore)

; Use write-highscore to setup file if it does not exist.
(define (setup-highscore-file path-name)
  (when (not (file-exists? path-name))
    (write-highscore '() path-name)))

; Print highscore list if there is such a list.
(define (print-highscore path-name)
  (let
      ([highscore-lst (read-highscore path-name)]
       [print-lst (lambda (lst k fn)
                    (if (eq? lst '())
                        (printf "\n")
                        (begin
                          (printf "~s: ~s ~s\n" k (caar lst) (cadar lst))
                          (fn (cdr lst) (+ k 1) fn))))])
    (if (eq? highscore-lst '())
        (printf "You are the first player!\n")
        (begin
          (printf "Top five!\n")
          (print-lst highscore-lst 1 print-lst)))))
              
; Save points if points are high enuough
(define (save-points player-points input-reader path-name max-length)
  (let
      ([score-lst (read-highscore path-name)]
       [lowest-score (lambda (lst fn)
                       (if (<= (length lst) 1)
                           (cadar lst)
                           (fn (cdr lst) fn)))])
    (if (and (> (length score-lst) 0)
             (and (>= (length score-lst) max-length)
                  (<= player-points (lowest-score score-lst lowest-score))))
        (printf "You did not make it to the top 5!\n")
        (begin
          (printf "enter your name!\n")
          (let
              ([player-name (input-reader)])
            (update-highscore (list player-name player-points) path-name max-length))))))

; Update highscore by inserting in correct position.
(define (update-highscore player-highscore path-name max-length)
  (write-highscore (insert-highscore(read-highscore path-name) player-highscore max-length) path-name)) 

; Insert new highscore in correct position in highscore list.
(define (insert-highscore highscore-lst input-lst max-length)
  (let ; Copy-rest copies the rest of the list.
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



; Write highscore to file. Re-write file each time. If it does not exist it is created.
(define (write-highscore highscore-lst path-name)
  (let
      ([f (open-output-file path-name #:mode 'text #:exists 'replace)])
    (displayln highscore-lst f)    
    (close-output-port f)))

; Read file.
(define (read-highscore path-name)
  (let ([r (open-input-file path-name #:mode 'text)])
    (let
        ([file-content (read r)])
      (close-input-port r)
      file-content)))

