# testing-c

test c program from other language using ffi.

## Common Lisp

### directory
- testing-c.asd
- lisp
  - test.lisp

### test runner
```sh
sbcl --noinform --non-interactive \
  --eval "(require 'asdf)" \
  --eval "(push (uiop:getcwd) asdf:*central-registry*)" \
  --eval "(asdf:test-system :testing-c/test)"
```

## D

### directory
- dub.sdl
- d
  - test.d

### test runner
```sh
dub test
```

## Erlang

### directory
- rebar.config
- erlang
  - test.erl
  - prop_c.erl
  - c.erl
  - c_src
    - erl_nif.c

### test runner
```sh
rebar3 eunit
rebar3 proper
```

## Go

### directory
- go.mod
- go
  - test.go
  - test_test.go

### test runner
```sh
go test ./...
```

## Haskell

### directory
- testing-c.cabal
- haskell
  - Test.hs

### test runner
```sh
cabal test
```

## Nim

### directory
- testing_c.nimble
- nim
  - config.nims
  - test.nim

### test runner
```sh
nimble test
```

## Python

### directory
- .python-version
- pyproject.toml
- uv.lock
- python
  - test_c.py

### test runner
```sh
python -m unittest discover -s python
```

## Rust

### directory
- Cargo.lock
- Cargo.toml
- build.rs
- rust
  - test.rs

### test runner
```sh
cargo test
```

## Zig

### directory
- build.zig
- build.zig.zon
- zig
  - test.zig

### test runner
```sh
zig build test --summary all
```
