;Problem 2
(define power
  (lambda (n)
    `(lambda (x)
       ,(cond ((= n 0) `1)
              ((= n 1) `x)
              (else `(* ,@(let loop ((n n))
                            (if (= n 0) `() `(x ,@(loop (- n 1)))))))))))


(define tree '(a (b (c () ()) (d () ())) (e (f () ()) (g () ()))))
(define bombtree '(a (b (c () ()) (d () ())) (* (f () ()) (g () ()))))

(define root car)
(define ltree cadr)
(define rtree caddr)
(define emptytree? null?)
(define inorder
  (lambda (bt) 
    (if (emptytree? bt) 
        '() 
        (append (inorder (ltree bt)) (cons (root bt) (inorder (rtree bt)))))))


;Problem 3
(define inorderAPS
  (lambda (bt)
    (let inorderAPS ((bt bt)(acc '()))
      (if (emptytree? bt)
          acc
          (inorderAPS (ltree bt) (cons (root bt) (inorderAPS (rtree bt) acc)))))))

;Problem 4
(define inorderCPS
  (lambda (bt)
    (let inorderCPS ((bt bt)(c (lambda (v) v)))
      (cond ((emptytree? bt) (c '()))
        ((eq? (root bt) '*) 'Bomb!)
        (else (inorderCPS (ltree bt) 
                (lambda (ls)
                  (inorderCPS (rtree bt)
                    (lambda (rs) 
                      (c (append ls (cons (root bt) rs))))))))))))

;Problem 5
(define inorderCC
  (lambda (bt)
    (call/cc 
      (lambda (exit)
        (let inorder ((bt bt))
          (cond ((emptytree? bt) '())
            ((eq? (root bt) '*) (exit 'Bomb!))
            (else (append (inorder (ltree bt)) (cons (root bt) (inorder (rtree bt)))))))))))