LANG := \
	d \
	go \
	nim \
	rust \
	zig \

TARGETS := $(addsuffix -test,$(LANG))

.PHONY: all clean $(TARGETS)

all: $(TARGETS)
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
