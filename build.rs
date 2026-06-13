use std::{env, path::PathBuf};

fn main() {
    println!("cargo::rerun-if-changed=c/lib.c");
    println!("cargo::rerun-if-changed=c/lib.h");
    cc::Build::new().file("c/lib.c").compile("lib");

    let bindings = bindgen::Builder::default()
        .header("c/lib.h")
        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
        .generate()
        .expect("Unable to generate bindings");
    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap());
    bindings
        .write_to_file(out_path.join("bindings.rs"))
        .expect("Couldn't write bindings!");
}
