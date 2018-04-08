#lang web-server/insta

(define (start request)
  (response/xexpr
   '(html
     (head (title "Test page for test server"))
     (body (h1 "First try at racket webserver")))))
(no-web-browser)