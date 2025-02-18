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

(*let f (x:int list) y = (x :: y);;*)

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

let rec map f lst =
  match lst with
  | [] -> []
  | h::t -> f h :: (map f t)
;;

map (fun x -> string_of_int x) [1;2;3;4;5];;

(*takes a function with 2 args, an accumulator, and list
 applies function to each member of the list with accumulator
 reduce list into a single value*)
let rec fold f acc lst = 
  match lst with
  | [] -> acc
  | h::t -> fold f (f acc h) t
;;

let add a b = a + b;;

(*adds 1 to 2 to 3 returns 6*)
fold add 0 [1;2;3];;

(* all numbres greater than 5*)
fold (fun acc v -> v > 5 && acc) true [6;7;8;9;10];;

(*more complex example*)

let l = [[1;2;3;];[4;5;];[6;7]];;

(*adds each sublist together*)
map (fun x -> fold add 0 x) l;;

(*folds the sublist answers together with + operator
to get total sum of all the lists*)
fold (+) 0 (map (fun x -> fold add 0 x) l);;

(*does operations starting from the right to left*)
let rec fold_right f acc lst =
  match lst with
  | [] -> acc
  | h::t -> f h (fold_right f acc t)
;;

(*fold returns -6, fold_right returns 2*)
fold (-) 0 [1;2;3];;
fold_right (-) 0 [1;2;3];;

(*can make a type*)
type gen = Int of int
          | Str of string
          | Fl of float
;;
Int 10;; (*gen type*)
Str "Hello";; (*gen type*)

(*can make list of gen types cuz they are same gen type 
even tho they are int vs string vs float*)
[Int 4; Int 5; Str "Hello"; Str "World"; Fl 1.5];;

type coin = Head | Tail;;

(*type is 'coin list'*)
[Head; Head; Tail];;

(*processes the diff types*)
let process x y =
  match x, y with
  | Int i, Int j -> Int (i + j)
  | Str s, Str t -> Str (s ^ t)
  |_ -> failwith "error"
;;

(*Adds ints, concatanates strings*)
process (Int 10) (Int 20);;
process (Str "Hello") (Str "World");;

(*option*)
(* could be none or could be some 'a'*)
type 'a option = None | Some of 'a;;

let hd l = 
  match l with
  | [] -> None
  | h::_ -> Some h 
;;

hd [];; (*None*)
hd [1;2;3];; (*Some 1*)
hd ["good";"bad"];; (*Some good*);;

(*option matching with list 
overriding cons operator*)

type list = Nil | Cons of int * list
;;

Nil;;
Cons (1, Nil);;
Cons (1, (Cons (2, Cons (3, Nil))));;

(*2/18*)

(*
code: fun y -> y * 2
env: x = 10;

(fun x -> x + y, ([y,10]; (a,20)))

(*tail recursion:*)

exit point:
let rec fact n =
  if n = 0 then
    1
  else
    fact (n-1) * n
;;

fold_left f (f acc h) t
fold_right f acc (fold_right f acc t)
*)

(* imperative OCaml*)

(*
f(x) + f(x) + f(x) = 3v

f(x) = v

1) side effect
2) aliasing:
3) order of evaluation

foo 1+2 3+4
[f a; f b; f c]
*)


