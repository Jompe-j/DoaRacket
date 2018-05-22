#lang racket

(require "listHandling.rkt")
(provide save-points)
(provide setup-highscore-file)
(provide print-highscore)

; Use write-highscore to setup file if it does not exist.
(define (setup-highscore-file)
  (when (not (file-exists? "highscore.txt"))
    (write-highscore '())))

(define (print-highscore)
  (let
      ([highscore-lst (read-highscore)])
    (if (eq? highscore-lst '())
        (printf "Du är först att spela!\n")
        (let
            ([print-lst (lambda (lst k fn)
                          (if (eq? lst '())
                              (printf "\n")
                              (begin
                                (printf "~s: ~s ~s\n" k (caar lst) (cadar lst))
                                (fn (cdr lst) (+ k 1) fn))))])
          (begin
            (printf "Fem i topp!\n")
            (print-lst highscore-lst 1 print-lst))))))
              

(define (save-points player-points)
  (printf "enter your name!\n")
  (let
      ([player-name (read)])
    (printf "Is ~s your name? (yes or no)\n" player-name)
    (let
        ([answer (read)])
      (if (eq? answer 'yes)
          (update-highscore (list player-name player-points))
          (print "nope?")))))

(define (update-highscore player-highscore)
  (write-highscore (insert-highscore(read-highscore) player-highscore 5))) 

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
(define (write-highscore highscore-lst)
  (let
      ([f (open-output-file "highscore.txt" #:mode 'text #:exists 'replace)])
    (begin
      (displayln highscore-lst f)    
      (close-output-port f))))

; Read file.
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