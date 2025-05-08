#![allow(unused)]
#![allow(dead_code)]


fn foo(w:String) -> String {
    w + " world"
}

//fn foo(w : &str) -> usize {
//    w.len();
//}

fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() { x } else { y }
}

struct Point {
    x:i32,
    y:i32,
    color:String
}

enum Expr {
    Int(i32),
    Float(f64),
    Bool(bool)
}

fn main() {
    println!("Hello World");

    let s = String::from("HELLO BRUH");
    let t : &str = &s[3..9];
    println!("{}", t);

    let r = foo(s);
    println!("{}", r);

    // VECTORS
    
    let mut v:Vec<i32> = Vec::new();;
    v.push(100);
    v.push(200);

    println!("{:?}", v);

    let r : Option<&i32> = v.get(2);

    println!("{:?}", r);

    let z;
    let x = String::from("skdjfkjsfd");
    let y = String::from("bob");
    z = longest(&x, &y);

    println!("{}", z);

    //let p1 = Point{x:10, y:20, color:"red"};
    //
    //println!("{:?}", p1)
    
    //When borrowing, have to dereference to get its value
    
    /* LECTURE 4/29 - garbage collection
    .static (global) during entire execution
    .Stack fast alloc/dealloc, stack is small tho 
    .Heap has lot of memory
    
    Can use malloc(); to alloc memory to heap
    Implemented as linked list, just like C 
    Defragmentation, having small empty spaces is fragmentation
        This is not possible in C since uses pointers, only Java, OCaml, etc 
    
    Reference counting:
        let x = new Obj();
        let y = x;
    
    X and y are pointing to the same Obj
        x = null;
    
    Breaks the link of x
        y = new another();
    
    Breaks link of y, previous Obj becomes DEAD, garbage it 
    Rc in Rust = reference count 
    If there is a cycle, ref count gets cooked, garbage doesnt get collected
    Only trash it if no references to the Obj
    
    Mark and sweep:
        Visit entire heap, mark the unreachable objs (no refs)
        Visit again, and trash the marked garbage
        Does not move live objects, so doesn't defragment 
        Slower
    
    Copy:
        2 mirrored heaps, if reachable then copy it to new one 
        Don't copy unreachable ones

    *\

    /* 5/8 LECTURE NOTES 

    Can drop objects using drop(x);
    Same as calling free

    {} defines scoping of a variable

    Can't use a var after drop

    unsafe {} -> just like C code 

    What we learned in 330:

    OCaml:
        functional programming
        recursive functions
        code as data, functions are first class, funs can be args or return val 
        closure 
        pattern matching
        regex, fsa, state design
        lexing, parsing, CFG
        lambda calc
        rust 
        software security
        

}



