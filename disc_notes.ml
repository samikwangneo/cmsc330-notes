(*recursive function, use pattern matching
 construct new list w/o element
 if head is the elem, remove and recurse
 else keep and recurse*)

let rec remove_all lst x = 
  match lst with
  | [] -> []
  | h::t ->
      if h == x then remove_all t x
      else h :: remove_all t x

let index_of lst x = 
    let rec helper lst x i = match lst with
    | [] -> -1
    | h::t -> if x = h then i else (helper t x (i + 1)) 
in helper lst x 0;;

(*
a) 'a -> 'a -> bool
b) int -> int -> bool
c) int -> int -> string -> int
d) int -> int -> bool -> int
e) int -> int -> bool -> int list
f) (float -> bool) -> float -> float -> bool
g) bool -> int -> int -> int -> int
*)

(*2/14 discussion, map and fold*)

let list_add x nums = 
  List.map (fun elem -> x + elem) nums

let mold f lst = List.fold_left (fun a x -> a @ [(f x)]) [] lst 

let list_sum_product lst = 
  let (sum, product, index) = List.fold_left 
    (fun (even, odd, i) num -> 
      if i mod 2 = 0 
        then (even + num, odd, i + 1) 
        else (even, odd * num, i + 1)) 
    (0, 1, 0) lst 
  in (sum, product, sum = product);;
