(* Problem 2f *)
fun revl xs = foldl (fn (x,xs)=>x::xs) [] xs;

(* Problem 3 *)
fun n2c 0 f x = x
  | n2c n f x = f (n2c (n-1) f x);

fun c2n c = c (fn x=>x+1) 0;

infix 7 **;
infix 6 ++;

fun (m ++ n) f x = m f (n f x);

fun (m ** n) f x = n (m f) x; 

(* Problem 4 *)
datatype Nat = Zero | Succ of Nat;

fun n2N 0 = Zero
  | n2N n = Succ (n2N (n-1));

fun N2n Zero = 0
  | N2n (Succ n) = 1+N2n n;

infix 7 ***;
infix 6 +++;

fun Zero +++ n = n
  | (Succ m) +++ n = Succ (m +++ n);

fun Zero *** _ = Zero
  | (Succ m) *** n = n +++ m *** n;

fun !!! Zero = Succ Zero 
  | !!! (Succ n) = Succ n *** !!! n;

val ! = N2n o !!! o n2N;


(* Problem 5 *)
local
    datatype etree = Leaf of int | Node of etree*(int*int->int)*etree;
   
    fun mketree (#"+"::xs) = operator op+ xs
      | mketree (#"-"::xs) = operator op- xs
      | mketree (#"*"::xs) = operator op* xs
      | mketree (#"/"::xs) = operator op div xs
      | mketree (#"%"::xs) = operator op mod xs
      | mketree (x::xs) = (Leaf (ord x-ord #"0"),xs)
    and
        operator f xs = let val (lchild,ys) = mketree xs 
                            val (rchild,zs) = mketree ys 
                        in (Node(lchild,f,rchild),zs) end;
    
    val prefix2etree = #1 o mketree;

    fun inorder (Leaf x) = x
      | inorder (Node(l,f,r)) = f(inorder l,inorder r); 
in
    val eval = inorder o prefix2etree o explode
end;

val e1="+2*34";
val e2="+*/83%-9246";

(* let version *)
(*
val eval 
= let
    datatype etree = Leaf of int | Node of etree*(int*int->int)*etree;
   
    fun mketree (#"+"::xs) = operator op+ xs
      | mketree (#"-"::xs) = operator op- xs
      | mketree (#"*"::xs) = operator op* xs
      | mketree (#"/"::xs) = operator op div xs
      | mketree (#"%"::xs) = operator op mod xs
      | mketree (x::xs) = (Leaf (ord x-ord #"0"),xs)
    and
        operator f xs = let val (lchild,ys) = mketree xs 
                            val (rchild,zs) = mketree ys 
                        in (Node(lchild,f,rchild),zs) end;

    val prefix2etree = #1 o mketree;

    fun inorder (Leaf x) = x
      | inorder (Node(l,f,r)) = f(inorder l,inorder r); 
  in
    inorder o prefix2etree o explode
  end;
*)

