(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (enumerate-helper s n)
    (if (null? s)
        '()
        (cons (list n (car s))
              (enumerate-helper (cdr s) (+ n 1)))))
  (enumerate-helper s 0)
  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists S1 and S2 according to ORDERED? and return
;; the merged lists.
(define (merge ordered? s1 s2)
  ; BEGIN PROBLEM 16
  (define (merge-helper s1 s2 result)
    (cond ((null? s1) (append result s2))
          ((null? s2) (append result s1))
          ((ordered? (car s1) (car s2))
           (merge-helper (cdr s1) s2 (append result (list (car s1)))))
          (else
           (merge-helper s1 (cdr s2) (append result (list (car s2)))))))
  (merge-helper s1 s2 '())
  )
  ; END PROBLEM 16

;; Optional Problem 2

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN OPTIONAL PROBLEM 2
          expr
         ; END OPTIONAL PROBLEM 2
         )
        ((quoted? expr)
         ; BEGIN OPTIONAL PROBLEM 2
          expr
         ; END OPTIONAL PROBLEM 2
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
            (if (and (lambda? expr)
                      (null? body))
                expr  ; If it's a lambda with no body, return it as is
                (cons form
                      (cons params
                            (map let-to-lambda body))))
           ; END OPTIONAL PROBLEM 2
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
            (let ((vars (map car values))   
                (vals (map cadr values)))  
             (let ((converted-vals (map let-to-lambda vals))  
                   (converted-body (map let-to-lambda body))) 
               (cons (cons 'lambda (cons vars converted-body)) 
                     converted-vals)))
           ; END OPTIONAL PROBLEM 2
           ))
        (else
         ; BEGIN OPTIONAL PROBLEM 2
          (map let-to-lambda expr)
         ; END OPTIONAL PROBLEM 2
         )))

; Some utility functions that you may find useful to implement for let-to-lambda

(define (zip pairs)
  (if (null? pairs)
      '(()())
      (let ((first (car pairs))
            (rest (zip (cdr pairs))))
            (list (cons (car first) (car rest))
                  (cons (list (cadr first)(cadr rest)))))))

