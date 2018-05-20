#lang racket

(require "personListEntry.rkt")
(require "testDoa.rkt")
(require "sumGame.rkt")

; (sum-points (game-loop arguably-dead '()))
; (game-loop arguably-dead '())

; (sum-points (game-loop arguably-dead '()))

;Entry point for Entire game
(define (play-doa)
  (printf "Välkommen till Dead or Alive! Nu kör vi!")
  (printf "Du fick ~s poäng!" (sum-points (game-loop arguably-dead '()))))


(define (save-points player-points)
  (printf "enter your name!\n")
  (let
      ([player-name (read)])
    (printf "Is ~s your name? (yes or no)\n" player-name)
    (let
        ([answer (read)])
      (if (eq? answer 'yes)
          (printf "~s" player-name)
          (print "nope?")))))