
fn foo(w:String) -> String {
    w + " world"
}


fn main() {
    println!("Hello World");
    let s = String::from("hello");
    // s is owner

    let t = s;
    // move ownership
    
    let r = foo(s);
    // moves ownership to r

    println!("()", r);
}
