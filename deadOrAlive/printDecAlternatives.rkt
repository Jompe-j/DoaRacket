#lang racket

(require "pickKInList.rkt")
(provide print-dec-alternatives)

(define (print-dec-alternatives input-alternatives-list)
  (begin
    (print (car (pick-k 0 input-alternatives-list)))
    (print (car (pick-k 1 input-alternatives-list)))))