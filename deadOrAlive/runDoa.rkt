#lang racket

(require "personListEntry.rkt")
(require "gameDoa.rkt")
(require "sumGame.rkt")
(require "updateHighscore.rkt")

; (sum-points (game-loop arguably-dead '()))
; (game-loop arguably-dead '())

; (sum-points (game-loop arguably-dead '()))
; ((Pooop 12) (John 11) (Bengt 11) (Sb 11) (ooo 8))
;Entry point for Entire game
(define (play-doa)
  (setup-highscore-file)
  (printf "Välkommen till Dead or Alive! Nu kör vi!\n")
  (let
      ([my-points (sum-points (game-loop arguably-dead '()))])
    (begin
      (printf "Du fick ~s poäng!" my-points )
      (save-points my-points))))


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