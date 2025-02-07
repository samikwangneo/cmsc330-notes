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

