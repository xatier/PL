;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fucking Scheme ...Orz
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Q2
(define pow 
  (lambda (n) 
    (if (= n 1) 
      `(lambda (x) x) 
      `(lambda (x) ( * . ,(let loop ((n n)) (if (= n 0) `() `(x . ,(loop (- n 1))))))))))

(display "2. ====\n")
(pow 1)
(pow 5)


;; Q3
(define root car)
(define ltree cadr)
(define rtree caddr)
(define emptytree? null?)

(define inorderAPS 
  (lambda (bt) 
    (let loop ((bt bt) (acc '())) 
      (if (emptytree? bt) 
        acc 
        (loop (ltree bt) (cons (root bt) (loop (rtree bt) acc)))))))

(define tree '(a (b (c () ()) (d () ())) (e (f () ()) (g () ()))))

(display "3. ====\n")
(inorderAPS tree)


;; Q4
(define inorderCPS 
  (lambda (bt)
    (let loop ((bt bt) (c (lambda (v) v)))
      (cond ((emptytree? bt) (c '()))
            ((eq? (root bt) '*) "boom")
            (else 
              (if (string? (loop (rtree bt) c))
                  "bomb"
                  (loop (ltree bt) (lambda (v) (cons (root bt) (loop (rtree bt) c))))))))))

(define bombtree '(a (b (c () ()) (d () ())) (e (* () ()) (g () ()))))

(display "4. ====\n")
(inorderCPS tree)
(inorderCPS bombtree)


;; Q5
(define get-back 'any)
(define inorderCC
  (lambda (bt)
    (let loop ((bt bt) (c (lambda (v) v)))
      (cond ((emptytree? bt) (c '()))
            ((eq? (root bt) '*) (call/cc (lambda (c) (set! get-back c) "boom")))
            (else 
              (if (string? (loop (rtree bt) c))
                (call/cc (lambda (c) (set! get-back c) "boom"))
                  (loop (ltree bt) (lambda (v) (cons (root bt) (loop (rtree bt) c))))))))))

(display "5. ====\n")
(inorderCC tree)
(inorderCC bombtree)
