#lang racket

(require "personListEntry.rkt")
(require "gameDoa.rkt")
(require "sumGame.rkt")
(require "updateHighscore.rkt")


;Entry point for Entire game
; Game loop.
(define (play-doa)
  (setup-highscore-file)
  (printf "Välkommen till Dead or Alive!\nNu kör vi!\n")
  (print-highscore)
  (let
      ([my-points (sum-points (game-loop arguably-dead '()))])
    (begin
      (printf "Du fick ~s poäng!\n" my-points )
      (save-points my-points))))


