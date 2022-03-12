(define (filter-lst fn lst)
  (if (null? lst) 
      '()
     (if (fn (car lst))
         (append (list (car lst))
                 (filter-lst fn 
                             (cdr lst)
                             )
                 )
         (filter-lst fn 
                     (cdr lst)
                     )
         
         )
      )
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)


(define (interleave first second)
  (if (null? first)
      second
      (if (null? second)
          first
          (append (list (car first))
                  (interleave second
                              (cdr first))
                  )
          )
      )
)

(interleave (list 1 3 5) (list 2 4 6))
; expect (1 2 3 4 5 6)

(interleave (list 1 3 5) nil)
; expect (1 3 5)

(interleave (list 1 3 5) (list 2 4))
; expect (1 2 3 4 5)


(define (accumulate combiner start n term)
  (combiner 
            start
            (if (= 1 n)
                (term n)
                (accumulate combiner (term n) n-1 term)
                )
            )
)


(define (no-repeats lst)
  (if (null? lst)
      lst
      (append
          (list (car lst))
          (no-repeats
          (filter-lst (lambda (x) (not (= x 
                                       (car lst))))
                      (cdr  lst))
          )
      )
      )
)

