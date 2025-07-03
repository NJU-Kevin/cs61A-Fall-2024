(define (ascending? s) 
            (if (null? s) #t
                (if (null? (cdr s)) #t
                    (if (<= (car s) (car (cdr s)))
                        (ascending? (cdr s))
                        #f))))

(define (my-filter pred s) 
  (if (null? s)
      '()
      (if (pred (car s))
          (cons (car s) (my-filter pred (cdr s)))
          (my-filter pred (cdr s)))))

(define (interleave lst1 lst2) 
  (if (null? lst1)
      lst2
      (if (null? lst2)
          lst1
          (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2)))))))

(define (member x s)
  (if (null? s)
      #f
      (if (equal? x (car s))
          #t
          (member x (cdr s)))))

(define (not-in x s);I define a helper function to check if an element is not in a list
  (if (null? s)
      #t
      (if (equal? x (car s))
          #f
          (not-in x (cdr s)))))
(define (no-repeats s) (if (null? s) '()
    (if (not-in (car s) (cdr s))
        (cons (car s) (no-repeats (cdr s)))
        (no-repeats (cdr s)))))


; The following is an alternative implementation of no-repeats that uses filter
;(define (no-repeats s)
;  (if (null? s) s
;    (cons (car s)
;      (no-repeats (filter (lambda (x) (not (= (car s) x))) (cdr s)))))
;)