;Problem 6c
(define Y
  (lambda (f)
    (let ((h (lambda (x) (f (lambda (y) ((x x) y))))))
      (h h))))

(define G
  (lambda (y) 
    (lambda (f) (f (lambda (z) ((y f) z))))))

(define IN
  (lambda (inorder)
    (lambda (bt) 
      (if (emptytree? bt) 
          '() 
          (append (inorder (ltree bt)) (cons (root bt) (inorder (rtree bt))))))))

(define inorderYG ((Y G) IN))

;Problem 7c
(define compile
  (lambda (exp)
    (cond ((or (symbol? exp)(number? exp)) exp)
          ((eq? (car exp) 'lambda) 
           (abstract (caadr exp)(compile (caddr exp))))
          (else `(,(compile (car exp))
                  ,(compile (cadr exp)))))))

(define abstract
  (lambda (x f)
    (cond ((eq? x f) 'I)
          ((or (symbol? f)(number? f)) `(K ,f))
          (else `((S ,(abstract x (car f))) 
                     ,(abstract x (cadr f)))))))

(define c+ (lambda (x) (lambda (y) (+ x y))))
(define c* (lambda (x) (lambda (y) (* x y))))

(define S (lambda (x) (lambda (y) (lambda (z) ((x z)(y z))))))
(define K (lambda (x) (lambda (y) x)))
(define I ((S K) K))

(define compose '(lambda (f) (lambda (g) (lambda (x) (f (g x))))))
(define sq '(lambda (x) ((c* x) x)))
(define db '(lambda (x) ((c+ x) x)))

(define expr `(((,compose ,sq) ,db) 5))
