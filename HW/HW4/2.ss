a)

 (define my+
        (lambda args
                (if (null? args) 0
                            (apply + `(,(car args) ,(eval `(my+ . ,(cdr args))))))))

b)
最初的想法，不過似乎不會動 Orz
 (define mymax
        (lambda (x . args)
                (if (null? args) x
                            (let ((m (mymax args)))
                                          (if (> x m) x m)))))

(define mymax
  (lambda (x . args)
    (if equql? args `()) x (max x (apply mymax args))))

c)
C/C++ 的 list 是透過 va_* 系列 function 來移動 pointer ，看所需的 type 大小而決定要拿多少的空間當參數
scheme 則是直接拿整個 list, 透過 car/cdr 的方式一個接著一個的把參數拿出來並且 scheme 存 list 的方式會自己解決 type 的問題


