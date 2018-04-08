#lang slideshow
(require pict/flash)

(define (square n)
  (filled-rectangle n n))

(provide rainbow square)

; Exempel Local binding (let) vs define
; Define
(define (four p)
  (define two-p (hc-append p p))
    (vc-append two-p two-p))
; let
(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))

(define (checkerboard p)
  (let* ([rp (colorize p "red")]
         [bp (colorize p "black")]
         [c (checker rp bp)]
         [c4 (four c)])
    (four c4)))

; Functions are values
(define (series mk)
  (hc-append 4 (mk 5) (mk 10) (mk 20)))

;(series (lambda (size) (checkerboard (square size)))) WHY? - Because size is in two places - look!

(define (rgb-series mk)
  (vc-append
   (series (lambda (sz) (colorize (mk sz) "red")))
   (series (lambda (sz) (colorize (mk sz) "green")))
   (series (lambda (sz) (colorize (mk sz) "blue")))))
;(rgb-series circle) or (rgb-series square)
;Still why... or how?

;Onwards!

(define (rgb-maker mk)
  (lambda (sz)
    (vc-append (colorize (mk sz) "red")
               (colorize (mk sz) "green")
               (colorize (mk sz) "blue"))))

(define (rainbow p)
  (map (lambda (color)
         (colorize p color))
       (list "red" "orange" "yellow" "green" "blue" "purple")))

;(rainbow (square 10))
;(apply vc-append (rainbow (square 5))