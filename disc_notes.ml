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

(*2/21 discussion, regex*)

(*

and pattern - 2 chars next to eachother, e.g. ab
must be next to each other in expression

or pattern - pipe, e.g. a|b 
doesnt need to be next to eachother

precedence - (), gives higher priority to certain elements

set - [], can take any char from within set, only each single char, cant be both

range - [a-z], matches any elem in that range

negation - ^, excludes a set of chars, e.g. [^abc]

end of pattern, $, when put $ means must end there, i.e. abc$ - must end w abc

clean closure, *, means match with 0 ore more, like a* matches 0+ a's 

+, match with at least 1, a+

?, match with 0 or 1 a, a?

a{3}, match with 3 a's exactly

a{x, y}, match with at least x elems and at most y elems

for ex. a{3, 5} matchs with either 3, 4, or 5 elems

a{3,} matches with at least 3

meta characters - shortcuts for ranges
\d - any digit (equivalent to [0-9])
\D - any non digit ([^0-9])
\s - any whitespace char
\w - any alphanumeric char 
\W - any non alphanumeric char

^ is negation only valid inside of a set

^ outside of set means means must begin with it - i.e. ^a means must begin with a 
 
)

(*

^([A-Z][a-z])*([A-Z])?$



*)
