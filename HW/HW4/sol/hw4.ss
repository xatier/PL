; hw4_3a
(define my+
  (lambda args
    (if (null? args) 
        0
        (+ (car args) (apply my+ (cdr args))))))

; hw4_3b
(define mymax
  (lambda (x . args)
    (if (null? args) 
        x
        (let ((y (apply mymax args))) 
          (if (> x y) x y)))))