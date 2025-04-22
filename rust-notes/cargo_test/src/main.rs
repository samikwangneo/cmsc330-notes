#![allow(unused_variables)]
#![allow(dead_code)]

//fn foo(w : &str) -> usize {
//    w.len();
//}


fn main() {
    println!("Hello World");

    let s = String::from("HELLO BRUH");
    let t : &str = &s[3..6];
    println!("()", t);

}
