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

(*use the left side value plug into whatever is after the in keyword*)

(*output is 30 - x = 20 + x = 10 = 30*)
let x = 10 in (let x = 20 in x) + x;;

(*structs*)

type point = {x:int; y:int};;

let p1 = {x = 10; y = 20};;
let p2 = {x = 1; y = 2};;
p1.x;;
p1.y;;

(*access fields of struct with dot operator . *)

type color_point = {x:int; y:int; mutable color:string};;

let p3 = {x = 1; y = 1; color = "red"};;

p3.color;;

p3.color <- "blue";;

(*anon functions*)

fun x -> x * 2;;

(*bind anon function to normal function*)
let next = fun x -> x + 1;;

(*nested functions*)

let foo x =
  let bar y = y * y in
  bar x
;;

foo 2;;

(*passing functions as arguments*)

let apply f = f 10;;

apply (fun x -> x * x);;

(*higher order function - takes another func as arg*)

let twice g x = g (g x);;

let add x = x + 10;;

twice add 1;;
