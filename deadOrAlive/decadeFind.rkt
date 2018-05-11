#lang racket

(provide decade-find)

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