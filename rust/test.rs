#![cfg(test)]

mod c {
    #![allow(dead_code)]
    #![allow(non_camel_case_types)]
    #![allow(non_upper_case_globals)]
    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
}

#[test]
fn fibonacci_numer() {
    unsafe {
        assert_eq!(c::fibonacci(6), 8);
    }
}
