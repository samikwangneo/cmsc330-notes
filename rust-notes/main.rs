#![allow(unused)]
#![allow(dead_code)]


fn foo(w:String) -> String {
    w + " world"
}

//fn foo(w : &str) -> usize {
//    w.len();
//}


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

}
