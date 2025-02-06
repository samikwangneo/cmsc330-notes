let rec sum n =
  if n = 0 then 0 else n + sum (n-1);;

(*
'a means any type
as long as x and y are the same it will work
let f (x:int) y = (x = y);;

if one of them is int then both must be int and returns boolean*)

(* lists, use cons operator :: to prepend soething to start of list*)

[];; (*empty list*)

1::[];;

"bob"::[];;

2::(1::[]);;

(* lists can only have 1 type, the type is whatever is the first thing added to the list*)

let empty lst = lst = [];;

(*lst is a type*)

let f x y = x :: y;;

(*because you must prepend x to a list, y must be a list and the final list x :: y is a list itself*)

let f (x:int list) y = (x :: y);;

(*append 2 lists*)
[1;2;3]@[4;5;6];;

(*pattern matching

match e with
p1 -> e1
p2 -> e2
pn -> en

very fancy switch statement
*)

let neg x =
  match x with
  |true -> false
  |_ -> true
;;

(*underscore _ means wild card, use in match statements can be anything else, whatever else it is*)

(*head*)

let hd lst =
  match lst with
  |[] -> []
  |h::t -> [h]
;;

(*h::t is a var where h stands for head and t stands for tail, h::t is just that the list exists, return a list of just the head*)

let tail lst = 
  match lst with
  |[] -> []
  |_::t -> t
;;

(*need to have a match for every case, otherwise will fail on the matches that arent listed*)

let rec last lst =
  match lst with
  |[] -> []
  |[x] -> [x]
  |_::t -> last t
;;

(*add item to end of list*)

let rec append lst x = 
  match lst with
  | [] -> [x]
  | h::t -> h :: (append t x)
;;

(*check if an item is a member of a list*)

let rec member lst x =
  match lst with
  | [] -> false
  | h::t -> h = x || member t x
;;
      (*if h = x then*)
      (*  true*)
      (*else member t x*)

(*tuples*)

(1, "a");;

let add (a,b) = a + b;;

(* first element of a tuple*)
let first t = 
  match t with
  | (a, b) -> a
;;

(* let expressions *)

let x = 1 + 2 in x * x;;

let x = 10 in (let y = 20 in x * y);;


