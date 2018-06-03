#lang racket

(require "personListEntry.rkt")
(require "gameDoa.rkt")
(require "sumGame.rkt")
(require "updateHighscore.rkt")
(require "inputReaders.rkt")
(require "gameSettings.rkt")

;Entry point for Entire game
; Game loop.
(define (play-doa)
  (setup-highscore-file path/name)
  (printf "Welcome to Dead or Alive!\nLet's roll!\n")
  (print-highscore path/name)
  (let
      ([my-points (sum-points (game-loop arguably-dead '()))])
    (printf "You got ~s points!\n" my-points )
    (save-points my-points string-reader path/name highscore-length)
    (printf "Do you want to play again? (yes or no)")
    (let
        ([play-again (string-reader)])
      (if (eq? play-again 'yes)
          (play-doa)
          (exit)))))
(play-doa)