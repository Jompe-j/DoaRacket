#lang racket
(require net/http-client)
(require json)
; Funderingar - Gör egna moduler per fråga? Blir väldigt nestat annars?
; Hur hanterar man att samma värde används flera gånger? Gör let? Spelar det roll?

; Game entry point
(define (start)
  ; Pick random item from list of persons.
  (let
      ((most-certainly-almost-dead (pick-k (random (length arguably-dead)) arguably-dead)))
    ; Multiple uses
    (let
        ((random-doa-item (car most-certainly-almost-dead)))
      (begin    
        (printf "Is ~a dead or alive ?" random-doa-item)
        (let
            ((answer (read)))
          (if (eq? answer (pick-k 0 (cdr most-certainly-almost-dead)))
              (print "Correct!")
              (print "Nob.")))
        (printf "What year did ~a die?" random-doa-item)
        (let
            ((answer2 (read)))
          (if (eq? answer2 (pick-k 1 (cdr most-certainly-almost-dead)))
              (print "Correct.")
              (begin
                (let
                    ((decade-alternatives (decade-find (pick-k 1 (cdr most-certainly-almost-dead)))))
                  (print "no!")
                  (print-dec-alternatives decade-alternatives)
                  (printf "What decade did ~a die?" random-doa-item)
                  (let
                      ((answer3 (read)))
                    (print (pick-k 1 (cdr most-certainly-almost-dead)))
                    (print answer3))))))))))

(define (print-dec-alternatives input-alternatives-list)
  (begin
    (print (car (pick-k 0 input-alternatives-list)))
    (print (car (pick-k 0 input-alternatives-list)))))

           (define (pick-k k lst)
             (if (eq? k 0)
                 (car lst)
                 (pick-k (- k 1) (cdr lst))))

           (define (decade-find input-year)
             (let
                 ((decade (lambda (x)
                            (* (quotient x 10) 10))))
               ;; If decade is same as input-year decade, then true. else false. 
               (let
                   ((same-decade? (lambda (x y)
                                    (if (eq? (decade x) (decade y))
                                        #t
                                        #f))))
                 ;; Snyggare sätt att hantera boolen?
                 (list
                  (list (decade (-
                                 input-year
                                 5))
                        (same-decade? input-year (- input-year 5)))
                  (list (decade (+
                                 input-year
                                 5))
                        (same-decade? input-year (+ input-year 5)))))))


           (define arguably-dead
             '(("Hitler" . (dead 1945 Berlin))
               ("Moussolini" . (dead 1945  Giulino))
               ("Himmler" . (dead 1945 Lüneburg))))



           ;; (displayln (string->jsexpr "{ \"qwe\": 123, \"zxc\": [ 4, 5, 6 ] }"))

           (start)
           