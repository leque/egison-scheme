(define pm-map
  (lambda (f xs)
    (match-all xs (List Something)
               (`(join _ (cons x _)) (f x)))))

(pm-map (lambda (x) (+ x 10)) `(1 2 3 4))
; (11 12 13 14)

(define pm-concat
  (lambda (xss)
    (match-all xss (List (List Something))
               (`(join _ (cons (join _ (cons x _)) _)) x))))

(pm-concat `((1 2) (3) (4 5)))
; (1 2 3 4 5)

(define pm-concat2
  (lambda (xss)
    (match-all xss (Multiset (Multiset Something))
               (`(cons (cons x _)) x))))

(pm-concat2 `((1 2) (3) (4 5)))
; (1 2 3 4 5)
