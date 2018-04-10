#lang web-server/insta

(define (start request)
  (response/xexpr
   `(html (head (title "Test")
                (link ((rel "stylesheet")
                       (href "/test-static.css")
                       (type "text/css"))))
          (body (h1 "Testing Stuff")
                (h2 "This is h2!")
                (p "Whilst this is " (span ((class "hot")) "hot") ".")))))

(static-files-path "htdocs")
