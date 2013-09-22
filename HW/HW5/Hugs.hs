-- Empty module to serve as the default current module.
module Hugs where

-- 3 -----------------------------------------------------------------
-- (a
-- 先前算過的 value 會記憶起來，後面要用的時候可以直接 reference 到他
-- 8 + 0 = 8

-- (b
-- 不會先記憶算過的 value，所以每次用到都要重新算過
-- 36 + 36 = 72   36 = sum (1 .. 8)



-- 5 -----------------------------------------------------------------
-- (a
interleave x xs = [(take n xs) ++ [x] ++ (drop n xs) | n <- [0 .. length xs]]

-- (b
permutation [] =  [[]]
permutation (x:xs) = [zs | ys <- permutation xs, zs <- interleave x ys]

-- (c
nondecreasing [] =  True
nondecreasing xs  =  and [x <= y | (x, y) <- zip xs $ tail xs]

-- (d
sort xs = [ p | p<-permutation xs, nondecreasing p]


-- 6 -----------------------------------------------------------------
-- (a
-- 同 3(b, 不會記憶之前算出來的結果，要多做好多次沒有必要的運算

-- (b
pow2s x = 1 : [ x*2 | x <- (pow2s x)]

pow2 x = x : pow2(x*2)
pow2s = pow2 1

-- (d
pow2s = 1 : [ x*2 | x <- pow2s ]

pow2s = 1 : map (*2) pow2s




-- 7 -----------------------------------------------------------------
-- (a
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) | x < y = x:merge xs (y:ys)
                    | x > y = y:merge (x:xs) ys
                    | otherwise = x:merge xs ys

merge3 xs ys zs = merge xs $ merge ys zs

-- (b
hamming = 1 : merge3 (iterate (+2) 2)
                 (iterate (+3) 3)
                 (iterate (+5) 5)

ham a b c = 1 : merge3 [a*x | x<-[1..]]
                   [b*x | x<-[1..]]
                   [c*x | x<-[1..]]


-- (c
hamming' = [1, 2, 3, 5] ++ ( merge3 (f 2) (f 3) (f 5) )
    where f n = [x + n | x <- hamming, x `mod` n == 0]



-- 8 -----------------------------------------------------------------
-- (a
-- 會產生一張很大的圖，在還沒算出來之前就會造成大量空間使用 or stack over flow

-- (b
flodl' f a [] = a
foldl' f a (x:xs) = let a' = a `f` x in a' `seq` foldl' f a' xs

-- (c
-- 用 `seq` 強迫他先把前面的東西算出來
