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
    
    // When borrowing, have to dereference to get its value
    
    
    

}



