.PHONY: all clean d-test go-test nim-test rust-test zig-test

all: d-test go-test nim-test rust-test zig-test
	@echo "--- Tests in all language completed ---"

d-test:
	@echo "--- Running D tests ---"
	dub test

go-test:
	@echo "--- Running Go tests ---"
	go test ./...

nim-test:
	@echo "--- Running Nim tests ---"
	nimble test

rust-test:
	@echo "--- Running Rust tests ---"
	cargo test

zig-test:
	@echo "--- Running Zig tests ---"
	zig build test --summary all

clean:
	git clean -xdf
