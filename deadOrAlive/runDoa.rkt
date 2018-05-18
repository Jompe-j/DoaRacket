#lang racket

(require "personListEntry.rkt")
(require "testDoa.rkt")
(require "sumGame.rkt")

; (sum-points (game-loop arguably-dead '()))
; (game-loop arguably-dead '())

; (sum-points (game-loop arguably-dead '()))

(define (play-doa)
  (begin
    (print "Välkommen till Dead or Alive! Nu kör vi!")
    (printf "Du fick ~s poäng!" (sum-points (game-loop arguably-dead '())))))