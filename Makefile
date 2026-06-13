.PHONY: all clean go-test nim-test rust-test zig-test

all: go-test nim-test rust-test zig-test
	@echo "--- Tests in all language completed ---"

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
